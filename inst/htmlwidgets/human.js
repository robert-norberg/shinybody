HTMLWidgets.widget({
  name: "human",

  type: "output",

  factory: function (el) {
    return {
      renderValue: function (x) {
        el.innerHTML = "";

        x.participants.forEach(function (participant) {
          const container = document.createElement("div");
          container.id = `participant-${participant.id}`;
          container.style.marginBottom = "20px";

          const svgContainer = document.createElement("div");
          svgContainer.innerHTML = participant.svg_text;
          svgContainer.style.border = "1px solid #ccc";
          svgContainer.style.display = "inline-block";
          svgContainer.style.verticalAlign = "top";

          participant.selected_ids.forEach(function (selected_id) {
            const selectedPart = svgContainer.querySelector(`#${selected_id}`);
            if (selectedPart) {
              selectedPart.style.fill = "red";
              selectedPart.style.stroke = "blue";
            }
          });

          const infoContainer = document.createElement("div");
          infoContainer.style.display = "inline-block";
          infoContainer.style.marginLeft = "10px";
          infoContainer.style.verticalAlign = "top";
          infoContainer.innerHTML = `
            <strong>Participant ID:</strong> ${participant.id}<br>
            <strong>Gender:</strong> ${participant.gender}<br>
            <strong>Affected Body Parts:</strong> ${participant.selected_parts}<br>
          `;

          container.appendChild(svgContainer);
          container.appendChild(infoContainer);

          el.appendChild(container);
        });
      },

      resize: function (width, height) {
        // TODO: code to re-render the widget with a new size
      },
    };
  },
});
