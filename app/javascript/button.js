function button (){
  const mainLists = document.getElementsByClassName("main-list");
  const rideOns = document.getElementsByClassName("ride-on");
  const rideOffs = document.getElementsByClassName("ride-off");
  const attendances = document.getElementsByClassName("attendance");
  const absences = document.getElementsByClassName("absence");
  const rideOnColor = "background-color: #FF3366;"
  const rideOffColor = "background-color: #33CCFF;"
  const attendanceColor = "background-color: #66FF66;"
  const absenceColor = "background-color: #CCCCCC;"


  for(let i = 0; i < mainLists.length; i++) {
    if(rideOns[i] != null){
      rideOns[i].addEventListener('click', (e) => {
        e.preventDefault();
        const form = document.getElementsByClassName("form-ride-on");
        const studentUrl = form[i].action
        const putUrl = studentUrl
        const formData = new FormData(form[i]);
        const XHR = new XMLHttpRequest();
        
        XHR.open("PUT", putUrl , true);
        XHR.responseType = "json";
        XHR.send(formData);
        
        if (rideOffs[i].getAttribute("style") == rideOffColor) {
          rideOffs[i].removeAttribute("style");
          rideOffs[i].removeAttribute("disabled");
          rideOffs[i].removeAttribute("data-disable-with");
          rideOns[i].setAttribute("style", rideOnColor);
          rideOns[i].setAttribute("disabled", "true");
        }else{
          rideOns[i].setAttribute("style", rideOnColor)
        };
      });
    };
    
    if(rideOffs[i]){
      rideOffs[i].addEventListener('click', (e) => {
        e.preventDefault();
        const form = document.getElementsByClassName("form-ride-off")
        const studentUrl = form[i].action
        const putUrl = studentUrl
        const formData = new FormData(form[i]);
        const XHR = new XMLHttpRequest();
        
        XHR.open("PUT", putUrl , true);
        XHR.responseType = "json";
        XHR.send(formData);
        
        if (rideOns[i].getAttribute("style") == rideOnColor) {
          rideOns[i].removeAttribute("style");
          rideOns[i].removeAttribute("disabled");
          rideOns[i].removeAttribute("data-disable-with");
          rideOffs[i].setAttribute("style", rideOffColor);
          rideOffs[i].setAttribute("disabled", "true");
        }else{
          rideOffs[i].setAttribute("style", rideOffColor);
        };
      });
    };
      
      attendances[i].addEventListener('click', (e) => {
      e.preventDefault();
      const form = document.getElementsByClassName("form-attendance")
      const studentUrl = form[i].action
      const putUrl = studentUrl
      const formData = new FormData(form[i]);
      const XHR = new XMLHttpRequest();

      XHR.open("PUT", putUrl , true);
      XHR.responseType = "json";
      XHR.send(formData);

      if (absences[i].getAttribute("style") == absenceColor) {
        attendances[i].setAttribute("style", attendanceColor);
        attendances[i].setAttribute("disabled", "true");
        absences[i].removeAttribute("style");
        absences[i].disabled = false;
        if(rideOns[i] != null && rideOffs[i] != null){
          rideOns[i].removeAttribute("style");
          rideOns[i].disabled = false;
          rideOffs[i].removeAttribute("style");
          rideOffs[i].disabled = false;
        };
      }else{
        attendances[i].setAttribute("style", attendanceColor);
      };
    });

    absences[i].addEventListener('click', (e) => {
      e.preventDefault();
      const form = document.getElementsByClassName("form-absence")
      const studentUrl = form[i].action
      const putUrl = studentUrl
      const formData = new FormData(form[i]);
      formData.append("student[ride_id]", null)
      const XHR = new XMLHttpRequest();

      XHR.open("PUT", putUrl , true);
      XHR.responseType = "json";
      XHR.send(formData);

      attendances[i].removeAttribute("style")
      attendances[i].disabled = false;
      absences[i].setAttribute("style", absenceColor);
      absences[i].disabled = true;
      if(rideOns[i] != null && rideOffs[i] != null){
        rideOns[i].setAttribute("style", absenceColor);
        rideOns[i].disabled = true;
        rideOffs[i].setAttribute("style", absenceColor);
        rideOffs[i].disabled = true;
      };
    });
  };
};
window.addEventListener('load',button);