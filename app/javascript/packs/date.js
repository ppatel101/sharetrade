$(function () {
  $('.datetimepicker-input').datetimepicker({ format: "YYYY/MM/DD" });
  $('.timepicker-input').datetimepicker({ format: 'LT' });
  $('#checkbox').change(function () {
    if(this.checked) {
      $("div#half_day_div").addClass("d-block");
    }
    else{
      $("div#half_day_div").removeClass("d-block");
    }
  });
});