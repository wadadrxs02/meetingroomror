document.addEventListener("DOMContentLoaded", function () {
  var calendarEl = document.getElementById("calendar");
  var calendar = new FullCalendar.Calendar(calendarEl, {
    headerToolbar: {
      left: "prev,next today",
      center: "title",
      right: "dayGridMonth,timeGridWeek,timeGridDay",
    },
    selectable: true,
    selectHelper: true,
    editable: true,
    eventLimit: true,
    initialView: "dayGridMonth",
    events: "bookings/bookings.json",
  });

  calendar.render();
});
