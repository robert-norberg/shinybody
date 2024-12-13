HTMLWidgets.widget({
  name: "human",

  type: "output",

  factory: function (el) {
    let selectedOrgans = [];

    return {
      renderValue: function (x) {
        el.innerHTML = x.svg_text;
        el.style.border = "1px solid #ddd";
        el.style.display = "inline-block";
        el.style.margin = "2px";
        el.style.padding = "8px";
        el.style.verticalAlign = "top";
        el.style.borderRadius = "8px";
        el.style.overflow = "hidden";
        el.style.boxShadow = "0px 4px 6px rgba(0, 0, 0, 0.1)";

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

        let container = document.getElementById("organ-data-container");
        if (!container) {
          container = document.createElement("div");
          container.id = "organ-data-container";
          container.style.marginTop = "20px";
          container.style.padding = "15px";
          container.style.border = "1px solid #ddd";
          container.style.borderRadius = "8px";
          container.style.backgroundColor = "#f9f9f9";
          container.style.boxShadow = "0px 4px 6px rgba(0, 0, 0, 0.1)";
          container.style.fontFamily = "'Roboto', Arial, sans-serif";
          container.style.display = "none";
          el.parentNode.appendChild(container);
        }

        const title = document.createElement("h3");
        title.textContent = "Selected Organ Data";
        title.style.textAlign = "center";
        title.style.color = "#333";
        title.style.marginBottom = "20px";
        container.appendChild(title);

        Object.keys(x.organs).forEach(function (organ) {
          const shownPart = el.querySelector(`#${organ}`);
          const organObject = x.organs[organ];

          if (organObject.show) {
            shownPart.style.fill = organObject.color;
            shownPart.style.stroke = organObject.color;
            shownPart.style.cursor = "pointer";

            shownPart.addEventListener("mouseenter", function (event) {
              tooltip.textContent = organObject.name || organ;
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
                shownPart.removeAttribute("data-selected");
                shownPart.style.stroke = organObject.color;
                shownPart.style.strokeWidth = "0.3px";

                selectedOrgans = selectedOrgans.filter(
                  (item) => item !== organObject.name
                );
              } else {
                shownPart.setAttribute("data-selected", "true");
                shownPart.style.stroke = "black";
                shownPart.style.strokeWidth = "1px";

                selectedOrgans.push(organObject.name);
              }

              console.log("Selected organs:", selectedOrgans);

              if (window.Shiny) {
                if (selectedOrgans.length > 0) {
                  console.log("Sending", selectedOrgans);
                  Shiny.setInputValue("selected_body_parts", selectedOrgans);
                } else {
                  console.log("Sending", "no organs");
                  Shiny.setInputValue("selected_body_parts", "empty");
                }

                Shiny.addCustomMessageHandler(
                  "clear_selected_organs",
                  function (data) {
                    if (data.length === 0) {
                      selectedOrgans = [];

                      const container = document.getElementById(
                        "organ-data-container"
                      );
                      if (container) {
                        container.innerHTML = "";
                        container.style.display = "none";
                      }

                      console.log("Selected organs cleared.");
                    }
                  }
                );

                Shiny.addCustomMessageHandler(
                  "organ_data_response",
                  function (data) {
                    console.log("Received data from R:", data);

                    container.innerHTML = "";
                    container.appendChild(title);

                    if (data.length > 0) {
                      container.style.display = "block";
                      data.forEach((item) => {
                        const fieldContainer = document.createElement("div");
                        fieldContainer.style.marginBottom = "20px";
                        fieldContainer.style.padding = "15px";
                        fieldContainer.style.border = "1px solid #ccc";
                        fieldContainer.style.borderRadius = "8px";
                        fieldContainer.style.backgroundColor = "#ffffff";
                        fieldContainer.style.boxShadow =
                          "0px 2px 4px rgba(0, 0, 0, 0.1)";

                        // Organ Name
                        const organName = document.createElement("h4");
                        organName.textContent = `Organ: ${item.part}`;
                        organName.style.marginBottom = "10px";
                        organName.style.color = "#2c3e50";

                        // Description
                        const description = document.createElement("p");
                        description.textContent = `Description: ${item.description}`;
                        description.style.marginBottom = "8px";
                        description.style.fontSize = "14px";
                        description.style.color = "#7f8c8d";

                        // Info
                        const info = document.createElement("p");
                        info.textContent = `Info: ${item.info}`;
                        info.style.marginBottom = "8px";
                        info.style.fontSize = "14px";
                        info.style.color = "#7f8c8d";

                        // Risk Level
                        const riskLevel = document.createElement("p");
                        riskLevel.textContent = `Risk Level: ${item.risk_level}`;
                        riskLevel.style.marginBottom = "0";
                        riskLevel.style.fontSize = "14px";
                        riskLevel.style.fontWeight = "bold";
                        riskLevel.style.color =
                          item.risk_level === "High"
                            ? "#e74c3c"
                            : item.risk_level === "Medium"
                            ? "#f39c12"
                            : "#2ecc71";

                        fieldContainer.appendChild(organName);
                        fieldContainer.appendChild(description);
                        fieldContainer.appendChild(info);
                        fieldContainer.appendChild(riskLevel);
                        container.appendChild(fieldContainer);
                      });
                    } else {
                      container.style.display = "none";
                    }
                  }
                );
              }
            });
          }
        });
      },

      resize: function (width, height) {
        // TODO: code to re-render the widget with a new size
      },
    };
  },
});
