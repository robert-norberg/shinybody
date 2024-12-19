HTMLWidgets.widget({
  name: "human",

  type: "output",

  factory: function (el) {
    el.style.border = "1px solid #ddd";
    el.style.display = "inline-block";
    el.style.margin = "2px";
    el.style.padding = "8px";
    el.style.verticalAlign = "top";
    el.style.borderRadius = "8px";
    el.style.overflow = "hidden";
    el.style.boxShadow = "0px 4px 6px rgba(0, 0, 0, 0.1)";
    el.style.width = 'max-content';
    el.style.height = 'auto';

    let selectedOrgans = [];

    const tooltip = document.createElement("div");
    tooltip.id = "tooltip";
    tooltip.style.position = "absolute";
    tooltip.style.padding = "8px 12px";
    tooltip.style.backgroundColor = "rgba(0, 0, 0, 0.75)";
    tooltip.style.color = "#fff";
    tooltip.style.borderRadius = "4px";
    tooltip.style.fontSize = "12px";
    tooltip.style.pointerEvents = "none";
    tooltip.style.display = "none";
    tooltip.style.zIndex = "10";
    document.body.appendChild(tooltip);

    var sel_handle = new crosstalk.SelectionHandle();
    var firstRun = true;

    return {
      renderValue: function (x) {
        el.innerHTML = x.svg_text;
        var organ_data = HTMLWidgets.dataframeToD3(x.organs);
        sel_handle.setGroup(x.settings.crosstalk_group);
        console.log("Clearing sel_handle before initial render");
        sel_handle.clear();
        selectedOrgans = []; // empty the selectedOrgans list upon rendering/re-rendering

        // initialize each shown organ
        organ_data.forEach(function (organObject) {
          const shownPart = el.querySelector(`#${organObject.organ_id}`);
          shownPart.setAttribute("data-color", organObject.color);

          if (organObject.show) {
            shownPart.setAttribute("data-show", true);
            shownPart.style.cursor = "pointer";
            if (organObject.selected) {
              shownPart.setAttribute("data-selected", "true");
              shownPart.style.fill = x.select_color;
              shownPart.style.stroke = "black";
              shownPart.style.strokeWidth = "1px";
              shownPart.style.opacity = 1;
              selectedOrgans.push(organObject.organ);
            } else {
              shownPart.setAttribute("data-selected", "false");
              shownPart.style.fill = shownPart.dataset.color;
              shownPart.style.stroke = shownPart.dataset.color;
              shownPart.style.strokeWidth = "0.3px";
              shownPart.style.opacity = 0.6;
            }

            let tooltip_contents = organObject.hovertext || organObject.organ;
            shownPart.addEventListener("mouseenter", function (event) {
              tooltip.innerHTML = tooltip_contents;
              tooltip.style.left = `${event.pageX + 10}px`;
              tooltip.style.top = `${event.pageY + 10}px`;
              tooltip.style.display = "block";
            });

            shownPart.addEventListener("mousemove", function (event) {
              tooltip.style.left = `${event.pageX + 10}px`;
              tooltip.style.top = `${event.pageY + 10}px`;
            });

            shownPart.addEventListener("mouseleave", function () {
              tooltip.style.display = "none";
            });

            shownPart.addEventListener("click", function () {
              if (shownPart.getAttribute("data-selected") === "true") {
                console.log(`Click: selected ${organObject.organ}`)
                shownPart.setAttribute("data-selected", "false");
                shownPart.style.fill = shownPart.dataset.color;
                shownPart.style.stroke = shownPart.dataset.color;
                shownPart.style.strokeWidth = "0.3px";
                shownPart.style.opacity = 0.6;

                selectedOrgans = selectedOrgans.filter(
                  (item) => item !== organObject.organ
                );
              } else {
                console.log(`Click: de-selected ${organObject.organ}`)
                shownPart.setAttribute("data-selected", "true");
                shownPart.style.fill = x.select_color;
                shownPart.style.stroke = "black";
                shownPart.style.strokeWidth = "1px";
                shownPart.style.opacity = 1;
                selectedOrgans.push(organObject.organ);
              }
              const selectedOrgansIds = selectedOrgans.map(
                organ_nm => el.querySelector(`.organ[data-organ-name=${organ_nm}`).id
              );
              sel_handle.set(selectedOrgansIds);
              console.log(`Selected keys: ${selectedOrgansIds}`)

              if (window.Shiny) {
                Shiny.setInputValue("clicked_body_part", organObject.organ);
                Shiny.setInputValue("selected_body_parts", selectedOrgans);
              }
            });
          }
        });
        // add double-click handler to the container that de-selects all organs
        el.addEventListener('dblclick', (event) => {
          // Only clear selection if double-click was not on a shown organ
          if (!event.target.dataset.show) {
            selectedOrgans.forEach(function (organ_nm) {
              console.log(`Doubleclick: de-selected ${organ_nm}`)
              const shownPart = el.querySelector(`.organ[data-organ-name=${organ_nm}`);
              shownPart.setAttribute("data-selected", "false");
              shownPart.style.fill = shownPart.dataset.color;
              shownPart.style.stroke = shownPart.dataset.color;
              shownPart.style.strokeWidth = "0.3px";
              shownPart.style.opacity = 0.6;
            });
            // Clear all selections
            selectedOrgans = [];
            console.log("Clearing sel_handle");
            sel_handle.clear();
            if (window.Shiny) {
              Shiny.setInputValue("clicked_body_part", null);
              Shiny.setInputValue("selected_body_parts", selectedOrgans);
            }
          }
        });
        // callback that is triggered by the sharedData selection changing
        sel_handle.on("change", function(event) {
          if (firstRun) {
            // do nothing
            console.log("First run, doing nothing.");
          } else {
            if (event.sender !== sel_handle) {
              console.log("event.sender !== sel_handle")
              // de-select all
              selectedOrgans.forEach(function (organ_nm) {
                console.log(`Selection Change (1): de-selected ${organ_nm}`)
                const selectedPart = el.querySelector(`.organ[data-organ-name=${organ_nm}`);
                selectedPart.setAttribute("data-selected", "false");
                selectedPart.style.fill = selectedPart.dataset.color;
                selectedPart.style.stroke = selectedPart.dataset.color;
                selectedPart.style.strokeWidth = "0.3px";
                selectedPart.style.opacity = 0.6;
              });
              selectedOrgans = [];
            } else {
              console.log("event.sender === sel_handle")
            }
            if (event.value) {
              console.log("sel_handle change event triggered")
              console.log(event);
              // deselect any currently selected organs that aren't in the change event's value
              selectedOrgans.forEach(function (organ_nm) {
                const selectedPart = el.querySelector(`.organ[data-organ-name=${organ_nm}`);
                if (!event.value.includes(selectedPart.id)) {
                  console.log(`Selection Change (2): de-selected ${organ_nm}`)
                  selectedPart.setAttribute("data-selected", "false");
                  selectedPart.style.fill = selectedPart.dataset.color;
                  selectedPart.style.stroke = selectedPart.dataset.color;
                  selectedPart.style.strokeWidth = "0.3px";
                  selectedPart.style.opacity = 0.6;
                  selectedOrgans = selectedOrgans.filter(
                    (item) => item !== organ_nm
                  );
                }
              });
              // now select any organs in the change event's value that aren't already selected
              event.value.forEach(function (organ_id) {
                const selectedPart = el.querySelector(`#${organ_id}`);
                const organ_nm = selectedPart.dataset.organName;
                if (selectedOrgans.includes(organ_nm)) {
                  console.log(`Selection Change: ${organ_nm} already selected, doing nothing`)
                  // do nothing, organ is already selected
                } else {
                  console.log(`Selection Change: Selected ${organ_nm}`)
                  selectedPart.setAttribute("data-selected", "true");
                  selectedPart.style.fill = x.select_color;
                  selectedPart.style.stroke = "black";
                  selectedPart.style.strokeWidth = "1px";
                  selectedPart.style.opacity = 1;
                  selectedOrgans.push(selectedPart.dataset.organName);
                }
              });
            } else {
              console.log("Selection Change: event.value is falsy, deselecting all organs")
              // de-select all
              selectedOrgans.forEach(function (organ_nm) {
                console.log(`Selection Change (3): de-selected ${organ_nm}`)
                const selectedPart = el.querySelector(`.organ[data-organ-name=${organ_nm}`);
                selectedPart.setAttribute("data-selected", "false");
                selectedPart.style.fill = selectedPart.dataset.color;
                selectedPart.style.stroke = selectedPart.dataset.color;
                selectedPart.style.strokeWidth = "0.3px";
                selectedPart.style.opacity = 0.6;
              });
              selectedOrgans = [];
            }
            if (window.Shiny) {
              Shiny.setInputValue("selected_body_parts", selectedOrgans);
            }
          }
        });
        // update crosstalk now that everything is initialized
        const selectedOrgansIds = selectedOrgans.map(organ_nm => el.querySelector(`.organ[data-organ-name=${organ_nm}`).id);
        console.log("Updating sel_handle now that all organs are rendered");
        sel_handle.set(selectedOrgansIds);
        firstRun = false;
        // update shiny now that everything is initialized
        if (window.Shiny) {
          Shiny.setInputValue("clicked_body_part", null);
          Shiny.setInputValue("selected_body_parts", selectedOrgans);
        }
      },

      resize: function (width, height) {
        // TODO: code to re-render the widget with a new size
      },
    };
  },
});
