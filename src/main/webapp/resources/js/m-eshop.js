function hideCategoryMenu() {
	$(".categoryMenu").mouseenter(function() {
		$(this).css("cursor", "pointer");
		$("#leftSide").css("display", "block");
	}).mouseleave(function() {
		$("#leftSide").css("display", "none");
	});
}