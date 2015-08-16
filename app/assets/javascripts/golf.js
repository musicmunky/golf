jQuery( document ).ready(function() {

	//IE doesn't like Google fonts...apparently it's Google's fault
	//at the moment, but whatever...load Web Safe font for IE users
	var gbr = FUSION.get.browser();
	if(gbr.browser && gbr.browser == "IE")
	{
		document.body.style.fontFamily = "'Trebuchet MS', Helvetica, sans-serif";
	}

	jQuery("#add_new_hole_btn").click(function(){
		addNewHole();
	});

	jQuery('#add_edit_course_hole_modal').on('hide.bs.modal', function (e) {
		clearNewHoleForm();
	});

	jQuery('#add_edit_course_hole_modal').on('show.bs.modal', function (e) {
		var ary = e.relatedTarget.id.split("-");
		var cid = ary[1];
		clearNewHoleForm();

		FUSION.get.node("add_edit_course_hole_course_id").value = cid;

		FUSION.set.overlayMouseWait();
		jQuery.ajax({
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
					//FUSION.get.node("add_edit_course_hole_content").innerHTML = response['message'];
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

	jQuery(".golflinks").each( function() {
		jQuery(this).removeClass("active");
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
			jQuery("#" + id).addClass("active");
		}
		else
		{
			jQuery("#" + model + "-link").addClass("active");
		}
	}
});


function addNewHole()
{
	var num = FUSION.get.node("new_hole_number").value;
	var par = FUSION.get.node("new_hole_par").value;
	var hnd = FUSION.get.node("new_hole_handicap").value;
	var blk = FUSION.get.node("new_hole_black").value;
	var blu = FUSION.get.node("new_hole_blue").value;
	var wht = FUSION.get.node("new_hole_white").value;
	var red = FUSION.get.node("new_hole_red").value;
	var grn = FUSION.get.node("new_hole_green").value;
	var sen = FUSION.get.node("new_hole_senior").value;
	var cid = FUSION.get.node("add_edit_course_hole_course_id").value;

	if(FUSION.lib.isBlank(num))
	{
		alert("Please enter a hole number!");
		return false;
	}

	if(FUSION.lib.isBlank(par))
	{
		alert("Please enter a par for this hole!");
		return false;
	}

	if(FUSION.lib.isBlank(hnd))
	{
		alert("Please enter a handicap for this hole!");
		return false;
	}

	if(FUSION.lib.isBlank(blk) && FUSION.lib.isBlank(blu) && FUSION.lib.isBlank(wht) && FUSION.lib.isBlank(red) && FUSION.lib.isBlank(grn) && FUSION.lib.isBlank(sen))
	{
		alert("Please enter a yardage for at least one tee!");
		return false;
	}

	if(FUSION.get.node("tr_" + cid + "_" + num))
	{
		alert("You have already added a hole with that number!");
		return false;
	}

	if(FUSION.get.node("handicap_td_" + cid + "_" + hnd))
	{
		alert("Please select a different handicap for this hole!");
		return false;
	}

	var newtr = FUSION.lib.createHtmlElement({"type":"tr", "attributes":{"id":"tr_" + cid + "_" + num}});
	var numtd = FUSION.lib.createHtmlElement({"type":"td"});
	var partd = FUSION.lib.createHtmlElement({"type":"td"});
	var blktd = FUSION.lib.createHtmlElement({"type":"td"});
	var blutd = FUSION.lib.createHtmlElement({"type":"td"});
	var whttd = FUSION.lib.createHtmlElement({"type":"td"});
	var redtd = FUSION.lib.createHtmlElement({"type":"td"});
	var grntd = FUSION.lib.createHtmlElement({"type":"td"});
	var sentd = FUSION.lib.createHtmlElement({"type":"td"});
	var hndtd = FUSION.lib.createHtmlElement({"type":"td"});

	//link to check out for updating the dom after contentEditable update:
	//https://css-tricks.com/snippets/javascript/saving-contenteditable-content-changes-as-json-with-ajax/

	//link to test browser for compatibility
	//http://codebits.glennjones.net/editing/events-contenteditable.htm

	var numdv = FUSION.lib.createHtmlElement({"type":"div", "text": num, "attributes":{"contentEditable":true}, "onblur":"checkHoleInfo()"});
	var pardv = FUSION.lib.createHtmlElement({"type":"div", "text": par, "attributes":{"contentEditable":true}});
	var blkdv = FUSION.lib.createHtmlElement({"type":"div", "text": blk, "attributes":{"contentEditable":true}});
	var bludv = FUSION.lib.createHtmlElement({"type":"div", "text": blu, "attributes":{"contentEditable":true}});
	var whtdv = FUSION.lib.createHtmlElement({"type":"div", "text": wht, "attributes":{"contentEditable":true}});
	var reddv = FUSION.lib.createHtmlElement({"type":"div", "text": red, "attributes":{"contentEditable":true}});
	var grndv = FUSION.lib.createHtmlElement({"type":"div", "text": grn, "attributes":{"contentEditable":true}});
	var sendv = FUSION.lib.createHtmlElement({"type":"div", "text": sen, "attributes":{"contentEditable":true}});
	var hnddv = FUSION.lib.createHtmlElement({"type":"div", "text": hnd, "attributes":{"id":"handicap_td_" + cid + "_" + hnd, "contentEditable":true}});

	var rmvtd = FUSION.lib.createHtmlElement({"type":"td"});
	var rmbtn = FUSION.lib.createHtmlElement({"type":"input",
											  "onclick":"removeNewHole('tr_" + cid + "_" + num + "')",
											  "attributes":{"class":"rem_new_hole_btn", "type":"button", "value":"-", "alt-text":"Remove this hole"}});
	rmvtd.appendChild(rmbtn);
	numtd.appendChild(numdv);
	partd.appendChild(pardv);
	blktd.appendChild(blkdv);
	blutd.appendChild(bludv);
	whttd.appendChild(whtdv);
	redtd.appendChild(reddv);
	grntd.appendChild(grndv);
	sentd.appendChild(sendv);
	hndtd.appendChild(hnddv);

	newtr.appendChild(numtd);
	newtr.appendChild(partd);
	newtr.appendChild(blktd);
	newtr.appendChild(blutd);
	newtr.appendChild(whttd);
	newtr.appendChild(redtd);
	newtr.appendChild(grntd);
	newtr.appendChild(sentd);
	newtr.appendChild(hndtd);
	newtr.appendChild(rmvtd);
	FUSION.get.node("add_edit_course_hole_tbody").appendChild(newtr);
}


function checkHoleInfo()
{
	alert("FOOBAR");
}


function clearNewHoleForm()
{
	FUSION.get.node("add_edit_course_hole_course_id").value = "";
	FUSION.get.node("new_hole_number").selectedIndex = -1;
	FUSION.get.node("new_hole_par").selectedIndex = -1;
	FUSION.get.node("new_hole_handicap").selectedIndex = -1;
	FUSION.get.node("new_hole_black").value = "";
	FUSION.get.node("new_hole_blue").value = "";
	FUSION.get.node("new_hole_white").value = "";
	FUSION.get.node("new_hole_red").value = "";
	FUSION.get.node("new_hole_green").value = "";
	FUSION.get.node("new_hole_senior").value = "";
	FUSION.get.node("add_edit_course_hole_tbody").innerHTML = "";
}


function removeNewHole(rid)
{
	var rowid = rid || "";
	if(FUSION.lib.isBlank(rid))
	{
		alert("Unable to remove this row - no row id.\nPlease refesh the page and try again");
		return false;
	}
	FUSION.remove.node(rid);
}


