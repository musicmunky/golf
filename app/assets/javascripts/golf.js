$( document ).ready(function() {

	//IE doesn't like Google fonts...apparently it's Google's fault
	//at the moment, but whatever...load Web Safe font for IE users
	var gbr = FUSION.get.browser();
	if(gbr.browser && gbr.browser == "IE")
	{
		document.body.style.fontFamily = "'Trebuchet MS', Helvetica, sans-serif";
	}
/*
	jQuery("#add_edit_holes_link").click(function(){
		alert("This is a test!");
	});
*/
	$('#add_edit_course_hole_modal').on('show.bs.modal', function (e) {
		var ary = e.relatedTarget.id.split("-");
		var cid = ary[1];
		FUSION.get.node("modal-window-content").innerHTML = "Hello World! " + cid;

		FUSION.set.overlayMouseWait();
		$.ajax({
			type: "GET",
			url: "/courses/" + cid + "/getCourseHoleInfo",
			data:{
				course_id:  cid,
			},
			beforeSend: function(xhr) {
				xhr.setRequestHeader("X-CSRF-Token", $('meta[name="csrf-token"]').attr('content'));
				xhr.setRequestHeader("Accept", "text/html");
			},
			success: function(result){
				var response = JSON.parse(result);
				if(response['status'] == "success")
				{
					FUSION.get.node("modal-window-content").innerHTML = response['message'];
				}
				FUSION.set.overlayMouseNormal();
				return false;
			},
			error: function(){
				FUSION.set.overlayMouseNormal();
				FUSION.error.showError("There was a problem retrieving the course hole information");
			}
		});
		//return false;
	});

	$(".golflinks").each( function() {
		$(this).removeClass("active");
	});

	var url = window.location.pathname;
	if(url.charAt(0) == "/")
	{
		url = url.substring(1);
	}

	var urlary = url.split("/");
	var model = urlary[0];
	if(!FUSION.lib.isBlank(model))
	{
		if(model == "users")
		{
			var id = "users-link";
			if(urlary.length > 1 && urlary[1] == "edit")
			{
				var uid = FUSION.get.node("current_user_id").value;
				id += "-" + uid;
			}
			$("#" + id).addClass("active");
		}
		else
		{
			$("#" + model + "-link").addClass("active");
		}
	}
});


function verifyUploadName()
{
	var fname = FUSION.get.node("data_upload_field").value;
	var farry = fname.split(".");
	var ext = farry[farry.length - 1];

	if(FUSION.lib.isBlank(fname))
	{
		FUSION.lib.alert("<p style='text-align:center;'>Please be sure to select a file before submitting</p>");
		return false;
	}

	if(ext != "txt" && ext != "tab")
	{
		alert("EXT IS " + ext);
		FUSION.lib.alert("<p style='text-align:center;'>Please only upload text files / documents</p>");
		return false;
	}

	return true;
}