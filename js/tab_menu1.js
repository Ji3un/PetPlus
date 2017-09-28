    function ShowTab(val) {
        for (i = 2; i < 6; i++) {
            var tb = document.getElementById('tab_' + i);
            if (i != val) tb.style.display = "none";
            else tb.style.display = "block";
        }
    }
    
