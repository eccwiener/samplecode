<div class="modal fade styled-modal win-modal" id="sharePostModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="myModalLabel">Share Post</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                	 <form id="add-location" method="post" action="" novalidate>
	                	<div class="form-group" data-type="department">
						    <!--<label for="dept">Write something</label>-->
						    <input type="text" ng-model='sharePostComment' class="form-control" name="<portlet:namespace />shareComment" id="dept" placeholder="Write something" autocomplete="off">
						</div>
						
						<p>
				        	
				        		{{postToShare.businessName}}
				        	
				        	{{postToShare.content}}
				        </p>
				        
						<div ng-if="postToShare.isVideo == 'TRUE'">
							<video ng-if="postToShare.filePath != ''" width="320" height="240" controls>
							  <source src="{{postToShare.filePath}}">
							  Your browser does not support the video tag.
							</video>
						</div>
						
						<div ng-if="postToShare.isVideo == 'FALSE'">
							<img ng-if="postToShare.filePath != ''" src="{{postToShare.filePath}}" class="postImage"/>				
						</div>
					
						<p class="text-right">
	                        	<a href="#" data-dismiss="modal" ng-click='clearSharePostPopup()' class="close-panel btn btn-submit">Cancel</a>
	                        	<button type="submit" data-dismiss="modal" class="btn btn-submit" ng-click="sharePost()">Share</button>
                       	</p>                                 
                    </form>
                </div>
            </div><!-- end .modal-body -->
        </div><!-- end .modal-content -->
    </div><!-- end .modal-dialog -->
</div><!-- end .modal -->