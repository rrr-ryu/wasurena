function button (){
  const rideOns = document.getElementsByClassName("ride-on");
  const rideOffs = document.getElementsByClassName("ride-off");
  const attendances = document.getElementsByClassName("attendance");
  const absences = document.getElementsByClassName("absence");
  const rideOnColor = "background-color: #FF3366;"
  const rideOffColor = "background-color: #33CCFF;"
  const attendanceColor = "background-color: #66FF66;"
  const absenceColor = "background-color: #CCCCCC;"


  for(let i = 0; i < rideOns.length; i++) {
    rideOns[i].addEventListener('click', () => {
      if (rideOns[i].getAttribute("style") == rideOnColor) {
        rideOns[i].removeAttribute("style")
      }else if (rideOffs[i].getAttribute("style") == rideOffColor) {
        rideOffs[i].removeAttribute("style");
        rideOns[i].setAttribute("style", rideOnColor)
      }else{
        rideOns[i].setAttribute("style", rideOnColor)
      };
    });

    rideOffs[i].addEventListener('click', () => {
      if (rideOffs[i].getAttribute("style") == rideOffColor) {
        rideOffs[i].removeAttribute("style");
      }else if (rideOns[i].getAttribute("style") == rideOnColor) {
        rideOns[i].removeAttribute("style");
        rideOffs[i].setAttribute("style", rideOffColor);
      }else{
        rideOffs[i].setAttribute("style", rideOffColor);
      };
    });

    attendances[i].addEventListener('click', () => {
      if (attendances[i].getAttribute("style") == attendanceColor) {
        attendances[i].removeAttribute("style")
      }else if (absences[i].getAttribute("style") == absenceColor) {
        attendances[i].setAttribute("style", attendanceColor);
        absences[i].removeAttribute("style");
        absences[i].disabled = false;
        rideOns[i].removeAttribute("style");
        rideOns[i].disabled = false;
        rideOffs[i].removeAttribute("style");
        rideOffs[i].disabled = false;
      }else{
        attendances[i].setAttribute("style", attendanceColor);
      };
    });

    absences[i].addEventListener('click', () => {
        attendances[i].removeAttribute("style")
        absences[i].setAttribute("style", absenceColor);
        absences[i].disabled = true;
        rideOns[i].setAttribute("style", absenceColor);
        rideOns[i].disabled = true;
        rideOffs[i].setAttribute("style", absenceColor);
        rideOffs[i].disabled = true;
      });
  };
};
window.addEventListener('load',button);