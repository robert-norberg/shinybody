HTMLWidgets.widget({

  name: 'human',

  type: 'output',

  factory: function(el, width, height) {

    return {

      renderValue: function(x) {

        // TODO: code to render the widget, e.g.
        el.innerHTML = x.svg_text;
        x.shown.forEach((item) => {
          console.log(item);
          let el_to_show = document.getElementById(item);
          console.log(el_to_show.style);
          el_to_show.style.fill = 'red';
          el_to_show.style.stroke = 'blue';
        })
      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
