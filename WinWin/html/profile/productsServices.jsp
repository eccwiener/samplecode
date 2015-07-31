<div class="tab-pane" id="products-services">
  <div class="services-products">
    <!--Day of the week -->
    <!--<h3 id="title">Services &amp; Products</h3>-->

	<p class="bordered-title borderless">
		<span>Products</span>
	</p>
	
    <div class="media" ng-repeat="product in businessProducts track by $index">
      <div class="pull-left">

        <p>{{product.productName}}</p>

      </div>
      <div class="media-body">
        <!-- Description Goes Here -->
        <p>
        	{{product.productDescription}}  
        </p>
      </div>
    </div>
    
    <p class="bordered-title borderless">
		<span>Services</span>
	</p>
	
    <div class="media" ng-repeat="service in businessServices track by $index">
      <div class="pull-left">

        <p>{{service.serviceName}}</p>

      </div>
      <div class="media-body">
        <!-- Description Goes Here -->
        <p>
        	{{service.serviceDescription}}  
        </p>
      </div>
    </div>
  </div>
</div>
