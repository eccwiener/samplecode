<div class="modal fade styled-modal" id="addEmployee" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <div class="modal-button"><button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
               <!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>-->
                <h3 class="modal-title" id="myModalLabel">Add Employee</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <form role="form" id="staff">
                        <%@include file="../accountsettings/includes/addStaff/addEmployee.jsp" %>
                        <p class="text-right"><a href="#" data-dismiss="modal" class="close-panel">Cancel</a><button type="submit" class="btn btn-submit">Send Invite</button></p>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
   /* $(function(){
        jQuery("#staffType").change(function(){

           var type = $(this).val();

            switch (type){
                case "employee":
                    $("#staff [data-type='employee']").show();
                    $("#staff [data-type='department']").hide();
                    $("#staff [data-type='location']").hide();
                    break;
                case "department":
                    $("#staff [data-type='department']").show();
                    $("#staff [data-type='employee']").hide();
                    $("#staff [data-type='location']").hide();
                    break;
                case "location":
                    $("#staff [data-type='location']").show();
                    $("#staff [data-type='employee']").hide();
                    $("#staff [data-type='department']").hide();
                    break;
                default:
                    $("#staff [data-type='department']").hide();
                    $("#staff [data-type='location']").hide();
            }
        });
    });*/
</script>