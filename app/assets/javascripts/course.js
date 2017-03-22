var ready = function(){
  $(".btn-enrollment").click(function(){
    alert("btn clicked")
    console.log(this.getAttribute("data-id"))

    var courseID = this.getAttribute("data-id");

    $.ajax({
      url: 'courses/' + courseID + "/enroll",
      dataType: "script",
      method: "post",
      data: {course_id: courseID},
    })
    .done(function() {
      console.log("enroll successful");
      alert("Thank you")
    })
    .fail(function() {
      console.log("error");

    });

  })
};

$(document).on("turbolinks:load", ready);