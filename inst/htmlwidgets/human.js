HTMLWidgets.widget({
  name: "human",

  type: "output",

  factory: function (el) {

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

        let selectedOrgans = [];

        Object.keys(x.organs).forEach(function (organ) {
          const shownPart = el.querySelector(`#${organ}`);
          const organObject = x.organs[organ];

          if (organObject.show) {
            shownPart.style.cursor = "pointer";
            if (organObject.selected) {
              shownPart.setAttribute("data-selected", "true");
              shownPart.style.fill = x.select_color;
              shownPart.style.stroke = "black";
              shownPart.style.strokeWidth = "1px";
              shownPart.style.opacity = 1;
              selectedOrgans.push(organObject.name);
            } else {
              shownPart.setAttribute("data-selected", "false");
              shownPart.style.fill = organObject.color;
              shownPart.style.stroke = organObject.color;
              shownPart.style.strokeWidth = "0.3px";
              shownPart.style.opacity = 0.6;
            }

            let tooltip_contents = organObject.hovertext || organObject.name;
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
                shownPart.removeAttribute("data-selected");
                shownPart.style.fill = organObject.color;
                shownPart.style.stroke = organObject.color;
                shownPart.style.strokeWidth = "0.3px";
                shownPart.style.opacity = 0.6;

                selectedOrgans = selectedOrgans.filter(
                  (item) => item !== organObject.name
                );
              } else {
                shownPart.setAttribute("data-selected", "true");
                shownPart.style.fill = x.select_color;
                shownPart.style.stroke = "black";
                shownPart.style.strokeWidth = "1px";
                shownPart.style.opacity = 1;
                selectedOrgans.push(organObject.name);
              }

              if (window.Shiny) {
                Shiny.setInputValue("clicked_body_part", organObject.name);
                Shiny.setInputValue("selected_body_parts", selectedOrgans);
              }
            });
          }
        });
        if (window.Shiny) {
          Shiny.setInputValue("selected_body_parts", selectedOrgans);
        }
      },

      resize: function (width, height) {
        // TODO: code to re-render the widget with a new size
      },
    };
  },
});
