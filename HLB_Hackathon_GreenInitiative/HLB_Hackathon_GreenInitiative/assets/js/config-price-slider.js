var slider = new Slider(".js-filter-price");
slider.on("slide", function (sliderValue) {
    document.getElementById("js-filter-result-val").textContent = sliderValue;
});

slider.on('change', function (val) {
    //val parameter above has value object which contains newValue 
    document.getElementById("js-filter-result-val").textContent = val.newValue;
});