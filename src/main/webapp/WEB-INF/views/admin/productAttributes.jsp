<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Main content -->
<section class="content"> 
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
      	<%-- <form id="submit_related_prods" action="<c:url value='/admin/product/attributes/${productId}'/>" method="post"> --%>
        <div class="box-header">
          <h3 class="box-title">Product Attributes</h3>
          <p style="float:right">
          	<a href="<c:url value="/admin/product/edit/${productId}"/>" class="btn btn-success">Back</a>&nbsp;
          </p>
        </div><!-- /.box-header -->
        <div class="box-body">
             <c:choose>
            	<c:when test="${not empty attribute.attributeMap}">
            		<form id="frm_attribute" action="<c:url value ='/admin/product/attribute/edit' />"  method="post">
            		<div id="attribute_content">
            		<c:forEach items="${attribute.attributeMap}" var="attributeMap">
            			<div class="box-body">
            				<div class="form-group">
            					<input size="30%" type="text" name="attributes" value="${attributeMap.key}" />
            					<input size="70%" type="text" name="attributeValues" value="${attributeMap.value}" />&nbsp;
            					<button type='button' class='attribute_remove'>Remove</button>
							</div>
            			</div>
			    	</c:forEach>
			    	</div>
			    	<div class="box-footer">
			    		<input type="hidden" name="productId" value="${productId}" />
						<button class="btn btn-primary" type="submit">Submit</button>
					</div>
			    	</form>
            	</c:when>
            </c:choose>
            <!-- </tbody>
          </table> -->
        </div><!-- /.box-body -->
       <!--  </form> -->
      </div><!-- /.box -->

    </div><!-- /.col -->
  </div><!-- /.row -->
</section><!-- /.content -->

<!-- jQuery 2.1.4 -->
 <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
 <!-- Bootstrap 3.3.5 -->
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 <!-- DataTables -->
 <script src="<c:url value = "/resources/admin/plugins/datatables/jquery.dataTables.min.js" />" ></script>
 <script src="<c:url value = "/resources/admin/plugins/datatables/dataTables.bootstrap.min.js" /> "></script>
 <!-- SlimScroll -->
 <script src="<c:url value = "/resources/admin/plugins/slimScroll/jquery.slimscroll.min.js" />" ></script>
 <!-- FastClick -->
 <script src="<c:url value = "/resources/admin/plugins/fastclick/fastclick.min.js" />" ></script>
 <!-- AdminLTE App -->
 <script src="<c:url value = "/resources/admin/dist/js/app.min.js" />" ></script>
 <!-- AdminLTE for demo purposes -->
 <script src="<c:url value = "/resources/admin/dist/js/demo.js" />" ></script>
 
 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>

<script>


// Delete category
function add_product_relation(product_id) {
	BootstrapDialog.confirm({
      title: 'WARNING',
      message: 'Are you sure you want to delete?',
      type: BootstrapDialog.TYPE_WARNING, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
      closable: true, // <-- Default value is false
      draggable: false, // <-- Default value is false
      btnCancelLabel: 'Cancel', // <-- Default value is 'Cancel',
      btnOKLabel: 'OK', // <-- Default value is 'OK',
      btnOKClass: 'btn-warning', // <-- If you didn't specify it, dialog type will be used,
      callback: function(result) {
          // result will be true if button was click, while it will be false if users close the dialog directly.
          if(result) {
        	  // Delete category
        	  var frm_product_delete = "#frm_product_delete_" + product_id;
    		$(frm_product_delete).submit();
          }else {
              // Do not execute any action and close the popup
          }
      }
  });
}


$(function() {
	
	var attributeElement = 
		'<div class="box-body">' +
			'<div class="form-group">' +
				'<input size="30%" type="text" name="attributes" value="" />&nbsp;' +
				'<input size="70%" type="text" name="attributeValues" value="" />' +
				'&nbsp;&nbsp;<button type="button" class="attribute_remove">Remove</button>&nbsp;<button type="button" id="add_attribute">Add</button>' + 
			'</div>' +
		'</div>';
	
	$('body').on('click','#add_attribute', function() {
		var theLastAttributeInput = $("input[name='attributeValues']").last();
		theLastAttributeInput.next().next().remove();
		//theLastAttributeInput.after("&nbsp;<button type='button' class='attribute_remove'>Remove</button>");
		theLastAttributeInput.parent().parent().after(attributeElement);
	});	
	
	var theLastAttributeInput = $("input[name='attributeValues']").last();
	//theLastAttributeInput.next().remove();
	theLastAttributeInput.next().after("<button type='button' id='add_attribute'>Add</button");
	
	$("body").on('click', '.attribute_remove', function() {
		
		$(this).parent().parent().remove();
		var theLastAttributeInput = $("input[name='attributeValues']").last();
		theLastAttributeInput.next().next().remove();
		theLastAttributeInput.next().after('&nbsp;<button type="button" id="add_attribute">Add</button>');
	});
	
});

</script>