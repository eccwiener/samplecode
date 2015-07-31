    <div class="tab-pane active" id="lookup-business">
        	<form role="form">
                    <div class="form-group">
                        <label class="control-label">Business Name:</label>
                     <angucomplete id="business-name"
                        pause="100"
                        localdata="businesses"
                        selectedobject="selectedBusinesses"
                        searchfields="name"
                        titlefield="name"
                        descriptionfield="address"
                        minlength="1"
                        arrowImage="autocomplete-blue-arrow.jpg"
                        inputclass="form-control form-control-small"/>
                    </div>
                 <div class="form-group">
                    <div class="text-right">
                        <a class="btn btn-orange">Save &amp; Continue</a>
                    </div>
                </div><!-- end .form-group -->
            </form>
        </div>