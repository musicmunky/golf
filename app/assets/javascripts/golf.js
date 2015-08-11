$( document ).ready(function() {

	//IE doesn't like Google fonts...apparently it's Google's fault
	//at the moment, but whatever...load Web Safe font for IE users
	var gbr = FUSION.get.browser();
	if(gbr.browser && gbr.browser == "IE")
	{
		document.body.style.fontFamily = "'Trebuchet MS', Helvetica, sans-serif";
	}

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