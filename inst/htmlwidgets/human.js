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

              if (window.Shiny) {
                if (selectedOrgans.length > 0) {
                  Shiny.setInputValue("selected_body_parts", selectedOrgans);
                } else {
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
                    }
                  }
                );

                Shiny.addCustomMessageHandler(
                  "organ_data_response",
                  function (data) {
                    container.innerHTML = "";
                    container.appendChild(title);

                    if (data.length > 0) {
                      container.style.display = "block";

                      data.forEach((item) => {
                        const fieldContainer = document.createElement("div");
                        fieldContainer.style.marginBottom = "20px";
                        fieldContainer.style.padding = "15px";
                        fieldContainer.style.border = "1px solid #ddd";
                        fieldContainer.style.borderRadius = "8px";
                        fieldContainer.style.backgroundColor = "#ffffff";
                        fieldContainer.style.boxShadow =
                          "0px 4px 6px rgba(0, 0, 0, 0.1)";
                        fieldContainer.style.fontFamily =
                          "'Roboto', Arial, sans-serif";

                        // Tumor Location
                        const tumorLocation = document.createElement("div");
                        tumorLocation.style.display = "flex";
                        tumorLocation.style.justifyContent = "space-between";
                        tumorLocation.style.marginBottom = "8px";
                        tumorLocation.innerHTML = `
                          <h2 style="margin: 0; color: #2c3e50; font-size: 16px;">Tumor Location:</h4>
                          <p style="margin: 0; font-size: 14px; color: #7f8c8d;">${item.tumor_location}</p>
                        `;

                        // Is Primary Tumor
                        const isPrimaryTumor = document.createElement("div");
                        isPrimaryTumor.style.display = "flex";
                        isPrimaryTumor.style.justifyContent = "space-between";
                        isPrimaryTumor.style.marginBottom = "8px";
                        isPrimaryTumor.innerHTML = `
                          <h2 style="margin: 0; color: #2c3e50; font-size: 16px;">Is Primary Tumor:</h4>
                          <p style="margin: 0; font-size: 14px; color: #7f8c8d;">${item.is_primary_tumor}</p>
                        `;

                        // Stage
                        const stage = document.createElement("div");
                        stage.style.display = "flex";
                        stage.style.justifyContent = "space-between";
                        stage.style.marginBottom = "8px";
                        stage.innerHTML = `
                          <h2 style="margin: 0; color: #2c3e50; font-size: 16px;">Stage:</h4>
                          <p style="margin: 0; font-size: 14px; color: #7f8c8d;">${item.stage}</p>
                        `;

                        // Risk Level
                        const riskLevel = document.createElement("div");
                        riskLevel.style.display = "flex";
                        riskLevel.style.justifyContent = "space-between";
                        riskLevel.innerHTML = `
                          <h2 style="margin: 0; color: #2c3e50; font-size: 16px;">Risk Level:</h4>
                          <p style="margin: 0; font-size: 14px; font-weight: bold; color: ${
                            item.stage === "III"
                              ? "#e74c3c"
                              : item.stage === "II"
                              ? "#f39c12"
                              : "#2ecc71"
                          };">${
                          item.stage === "III"
                            ? "High"
                            : item.stage === "II"
                            ? "Medium"
                            : "Low"
                        }</p>
                        `;

                        fieldContainer.appendChild(tumorLocation);
                        fieldContainer.appendChild(isPrimaryTumor);
                        fieldContainer.appendChild(stage);
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
