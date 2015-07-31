<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />

<div ng-controller="MessagingCntrl" class="messaging">
    <div class="container">

      <div class="sidebar col-sm-4">
        <div class="row">

          <div class="media"
	          ng-class="{selected: hover}" 
	    	  ng-mouseenter="hover = true"
	    	  ng-mouseleave="hover = false">
            <a class="pull-left" href="#">
              <img class="media-object" src="/WinWinTheme-theme/images/assets/messaging/media-1.png" alt="" />
            </a>
            <div class="media-body">
              <h5 class="media-heading">Bethpage Bank</h5>
              Hey whats going on with that event?
              <span class="info">12:30pm</span>
            </div>
          </div>

          <div class="media">
            <a class="pull-left" href="#">
              <img class="media-object" src="/WinWinTheme-theme/images/assets/messaging/media-2.png" alt="" />
            </a>
            <div class="media-body">
              <h5 class="media-heading">Bethpage Bank</h5>
              Hey whats going on with that event?
              <span class="info">Sun</span>
            </div>
          </div>

          <div class="media">
            <a class="pull-left" href="#">
              <img class="media-object" src="/WinWinTheme-theme/images/assets/messaging/media-2.png" alt="" />
            </a>
            <div class="media-body">
              <h5 class="media-heading">Bethpage Bank</h5>
              Hey whats going on with that event?
              <span class="info">Mon</span>
            </div>
          </div>

          <div class="media">
            <a class="pull-left" href="#">
              <img class="media-object" src="/WinWinTheme-theme/images/assets/messaging/media-2.png" alt="" />
            </a>
            <div class="media-body">
              <h5 class="media-heading">Bethpage Bank</h5>
              Hey whats going on with that event?
              <span class="info">Fri</span>
            </div>
          </div>

        </div>
      </div><!-- end sidebar list of messages -->


      <div class="col-sm-8 content">
        <div class="btn-group button-control pull-right">
          <button type="button" class="btn btn-default">+ New Message</button>
          <div class="btn-group">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
              <img src="/WinWinTheme-theme/images/assets/messaging/arrow-down.png" /> Actions
            </button>
            <ul class="dropdown-menu pull-right" role="menu">
              <li><a href="#"><small>Mark as Unread</small></a></li>
              <li><a href="#"><small>Delete Conversation</small></a></li>
              <li><a href="#"><small>Report Spam or Abuse</small></a></li>
            </ul>
          </div>
        </div>
        <h3>Bethpage Bank</h3>
        <div class="media">
          <a class="pull-left" href="#">
            <img class="media-object" src="/WinWinTheme-theme/images/assets/messaging/media-2.png" alt="" />
          </a>
          <div class="media-body">
            <h5 class="media-heading">Bethpage Bank</h5>
            Hey whats going on with that event?
          </div>
        </div>
        <div class="msg-info"><span>Sept 10</span></div>
        <div class="media">
          <a class="pull-left" href="#">
            <img class="media-object" src="/WinWinTheme-theme/images/assets/messaging/media-2.png" alt="" />
          </a>
          <div class="media-body">
            <h5 class="media-heading">Bethpage Bank</h5>
            Hey whats going on with that event?
          </div>
        </div>
        <div class="media">
          <a class="pull-left" href="#">
            <img class="media-object" src="/WinWinTheme-theme/images/assets/messaging/media-1.png" alt="" />
          </a>
          <div class="media-body">
            <h5 class="media-heading">Bethpage Bank</h5>
            Hey whats going on with that event?
          </div>
        </div>
        <div class="msg-info"><span>Today 12:33pm</span></div>
        <div class="media">
          <a class="pull-left" href="#">
            <img class="media-object" src="/WinWinTheme-theme/images/assets/messaging/media-1.png" alt="" />
          </a>
          <div class="media-body">
            <h5 class="media-heading">Bethpage Bank</h5>
            Hey whats going on with that event?
          </div>
        </div>
        <div class="row textarea-container">
          <textarea placeholder="Reply.." rows="7"></textarea>
          <div class="button-content">
            <span class="media-button"><img src="/WinWinTheme-theme/images/assets/messaging/paper-clip.png" /> Add Files <input type="file" /></span>
            <span class="media-button"><img src="/WinWinTheme-theme/images/assets/messaging/icon-img.png" /> Add Photos <input type="file" /></span>
            <a href="#" class="btn-reply">Reply</a>
          </div>
        </div>
      </div>
    </div><!-- end .container -->
</div><!-- 	end messagingcntrl -->