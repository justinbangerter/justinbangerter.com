(function() {
    function forEach(xs, f) {
        for(var i = 0; i < xs.length; i++) {
            f(xs[i]);
        }
    }
    forEach(document.getElementsByClassName('js-remove'), function(el) {
        el.parentNode.removeChild(el);
    });
    //This only handles one "sticky" element.
    forEach(document.getElementsByClassName('sticky'), function(el) {
        var originalOffset = el.offsetTop;
        var originalPadding = el.nextElementSibling.style.paddingTop;
        window.onload = function() {
            el.style.width = el.clientWidth + 'px';
        };
        window.onscroll = function() {
            if (window.pageYOffset > originalOffset) {
                el.classList.add('stuck');
                el.nextElementSibling.style.paddingTop = el.offsetHeight + 'px';
            }
            else {
                el.classList.remove('stuck');
                el.nextElementSibling.style.paddingTop = originalPadding;
            }
        }
    });
})();
