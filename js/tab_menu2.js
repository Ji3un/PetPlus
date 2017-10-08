    function ShowTab1(val) {
        for (i = 0; i < 2; i++) {
            var tb = document.getElementById('tab_' + i);
            if (i != val) tb.style.display = "none";
            else tb.style.display = "block";
        }
    }
    
