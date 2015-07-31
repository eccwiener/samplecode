  <div class="tab-pane" id="alliances">
    <div infinite-scroll="loadmore()" infinite-scroll-distance="0">
     <!-- <h3>Business Alliances</h3>-->
      <article class="result-part result-part-business" ng-repeat="business in businesses track by $index">
        <div class="col-md-3 result-bus-logo">
          <img class="pull-left" src="{{business.logo}}" border="0">
        </div>
        <!-- end col-md-5 result-bus-details -->

        <div class="col-md-5 result-bus-details details">
          <h3><a href="/profile?businessId={{business.businessId}}">{{business.name}}</a></h3>
          <ul class="result-bus-info">
            <li class="industry">
              <small>Industry: <span><b>{{business.industry}}</b></span> </small>
            </li>
            <li class="region">
              <small>Region: <span><b>{{business.region}}</b></span> </small>
            </li>
            <li class="address">
              <small>Address: <span><b>{{business.street}} {{business.city}}, {{business.state}} {{business.zip}}</b></span></small>
            </li>
          </ul>
        </div>
        <!-- end col-md-5 result-bus-details -->
        <div class="col-md-2 result-bus-details result-part-alliances">
          <ul class="result-bus-info">
            <li class="alliances-num">
              <small>Alliances: <span><b>{{business.allianceCount}}</b></span> </small>
            </li>
            <li class="comm-allies">
              <small>Common Alliances: <span><b>{{business.commonAlliesCount}}</b></span></small>
            </li>
          </ul>
        </div>
        <!-- end .col-md-2 result-bus-details -->

        <div class="col-md-2 result-bus-details result-part-proximity">
          <ul class="result-bus-info result-proximity">
            <li class="proximity">
              <small>{{business.distance}}</small>
            </li>
            <li class="iconology">
              <div class="winwin-icon">
                <a href="/colors" title="Click here to see what the icons mean!">
                  <img width="50" src="{{business.iconUri}}">
                </a>
              </div>
            </li>
          </ul>
        </div>
        <!-- end .col-md-2 result-bus-details -->

      </article>
      <!-- end .alliances result -->
      <div ng-show='loadmorePending.isBusy' class="text-center">
        <img src="/WinWinTheme-theme/images/assets/ajax-loader.gif" alt="" />
      </div>
    </div>
    <!-- repeat -->
  </div>