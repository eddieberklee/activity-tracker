
$(function() {
  
  $(".grid-box input[type='checkbox']").click(function() {
    var checked = $(this).prop('checked');
    $(this).prop('checked',!checked);
  });
  $(".grid-box").click(function() {
    $checkbox = $(this).find("input[type='checkbox']");
    var activity_id = $(this).attr("activity_id");
    var checked = $checkbox.prop('checked');
    $checkbox.prop('checked',!checked);
    $.ajax({
      url: "/activities/"+activity_id+'/checkit',
      data: {
        activity_id: activity_id,
        checked: !checked,
      },
      method: "POST",
      dataType: "JSON"
    }).success(function(json) {
      console.log('successful peazy');
    });
  });

  grid_delete_detection();
  function grid_delete_detection() {
    $(".grid-delete").click(function() {
      var c = confirm("You sure bro?");
      if (c == true) {
        var p = $(this).parents(".grid-box");
        var activity_id = p.attr("activity_id");
        $.ajax({
          url: "/activities/"+activity_id,
          data: {
            id: activity_id,
          },
          method: "DELETE",
          dataType: "JSON"
        }).success(function(json) {
          p.animate({
            width: "-=100%",
          }, 1000, function() {
            p.hide();
          });
        });
      } else {
        // do nothing
      }
    });
  }

  function new_grid_box(activity_id, title) {
    var grid_box_html = '<div class="grid-box" activity_id="'+activity_id+'"> \
        <input type="checkbox"> \
        <h3>'+title+'</h3> \
          <button class="grid-button grid-delete btn btn-danger" type="button"> \
            <span class="glyphicon glyphicon-trash"></span> \
          </button> \
        </div>';
      $newbox = $(grid_box_html);
      $lastbox = $("#main-grid").find(".grid-box").last();
      $newbox.find('h3').text(title); // set the new title
      $newbox.insertBefore($lastbox);
      grid_delete_detection();
  }

  $(".grid-add").click(function(e) {
    var p = $(this).parents("form");
    var title = p.find('input[type="text"]').val();
    e.preventDefault();
    $.ajax({
      url: "/activities",
      data: {
        "activity": {title: title}
      },
      method: "POST",
      dataType: "JSON"
    }).success(function(json) {
      console.log(json);
      activity_id = json;
      new_grid_box(activity_id, title);
    });
  });

  $("#grid-add-box").click(function(e) {
    var title = prompt("Enter the title of the activity you want to track:","eg. Pushups, Reading, Guitar...");
    if (title != null) {
      e.preventDefault();
      $.ajax({
        url: "/activities",
        data: {
          "activity": {title: title}
        },
        method: "POST",
        dataType: "JSON"
      }).success(function(json) {
        activity_id = json;
        new_grid_box(activity_id, title);
      });
    } // if title != null
  });

});




