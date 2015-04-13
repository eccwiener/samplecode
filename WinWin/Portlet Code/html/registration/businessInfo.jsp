   <form class="tab-pane active" id="business-info">
                <!--
                    <div class="logo-content">
                        <div class="logo">
                            <img src="/WinWinTheme-theme/images/assets/registration/logo.png" />
                        </div>
                        <div class="logo-detail">
                            <span>Upload Business Logo</span>
                            <div class="upload-wrapper">
                                <div class="upload">
                                    Browse Files
                                    <input type="file" name="<portlet:namespace />upload"/>
                                </div>
                                   <div class="file-info">
                                    <a href="#">
                                        <img src="/WinWinTheme-theme/images/assets/registration/icon-img.png" />
                                        Untitled-1_03.png
                                    </a>
                                    <span>(17.77 KB)</span>
                                  </div>
                                <a href="#" class="btn-upload">
                                    Upload File
                                   </a>
                            </div>
                        </div>
                     </div>
                 -->
                <div class="form-group">
                    <label class="control-label">Business Name:</label>
                    <input type="text" class="form-control" name="businessName" ng-model="business.businessName" required>
                </div>
                <div class="form-group">
                    <label class="control-label">Website Address:</label>
                    <input type="text" class="form-control" name="businessWebsite" ng-model="business.website">
                </div>
                <div class="form-group">
                    <label class="control-label">Tell us about the business</label>
                    <textarea class="form-control" name="about" id="about-company" rows="7" ng-model="business.aboutCompany" style="height: 180px" required></textarea>
                </div>

                <div class="form-group">
                    <label class="control-label">Pick an  Industry</label>
                    <select ng-model="industry" class="form-control" id="business.industry" name="industry" required>
                        <option value="_none">- Select a value -</option>
                        <option value="1">Agriculture</option>
                        <option value="5">Construction &amp; Manufacturing</option>
                        <option value="15">Education</option>
                        <option value="7">Energy &amp; Defense</option>
                        <option value="8">Entertainment</option>
                        <option value="11">Finance</option>
                        <option value="10">Food &amp; Beverage</option>
                        <option value="18">Government</option>
                        <option value="16">Health Care</option>
                        <option value="13">Media &amp; Communication</option>
                        <option value="3">Moving &amp; Storage</option>
                        <option value="17">Non-Profit</option>
                        <option value="14">Professional Services</option>
                        <option value="22">Property Management</option>
                        <option value="21">Real Estate</option>
                        <option value="19">Retail</option>
                        <option value="33">Sports</option>
                        <option value="12">Technology</option>
                        <option value="2">Transportation</option>
                        <option value="9">Travel</option>
                        <option value="20">Wholesale</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="control-label">How did you hear about WinWin?</label>
                    <select type="text" class="form-control" name="hear" ng-model="business.hear" required>
                        <option value="_none">- Select a value -</option>
                        <option value="Radio Commercial">Radio Commercial</option>
                        <option value="WinWin Staff or Recruiter">WinWin Staff or Recruiter</option>
                        <option value="Email or Advertising">Email or Advertising</option>
                        <option value="Networking Event">Networking Event</option>
                        <option value="Promotion">Promotion</option>
                        <option value="Brochure Kiosk">Brochure Kiosk</option>
                        <option value="Search Engine">Search Engine</option>
                        <option value="BragAboutMySite.com">BragAboutMySite.com</option>
                        <option value="Call Center">Call Center</option>
                        <option value="Other">Other</option>
                        <option value="bfmmail">BFM Mail Campaign</option>
                        <option value="bfmpr">BFM PR</option>
                    </select>
                </div>

                <div class="form-group"
                     ng-show="business.hear == 'Call Center' || business.hear == 'WinWin Staff or Recruiter' "
                     >
                    <label class="control-label">Who told you about WinWin?</label>
                    <select type="text" class="form-control"
                            ng-model="business.told"
                            ng-required="business.hear == 'Call Center' || business.hear == 'WinWin Staff or Recruiter'"
                            name="told"
                            >
                        <option value="_none">- Select a value -</option>
                        <option value="880 WCBS">880 WCBS</option>
                        <option value="1010 WINS">1010 WINS</option>
                        <option value="Business News Weekly">Business News Weekly</option>
                        <option value="Call Center">Call Center</option>
                        <option value="Hamptons Mouthpiece">Hamptons Mouthpiece</option>
                        <option value="Huffington Post">Huffington Post</option>
                        <option value="LIBN">LIBN</option>
                        <option value="Mashable">Mashable</option>
                        <option value="Received an e-mail">Received an e-mail</option>
                        <option value="Amanda Rosenblaum">Amanda Rosenblaum</option>
                        <option value="Annamarie Casano">Annamarie Casano</option>
                        <option value="Beth Bodenmiller">Beth Bodenmiller</option>
                        <option value="Bruce Chamoff">Bruce Chamoff</option>
                        <option value="Charles Shields">Charles Shields</option>
                        <option value="Christian Tiller">Christian Tiller</option>
                        <option value="Cindy Mardenfeld">Cindy Mardenfeld</option>
                        <option value="Contractors for Kids">Contractors for Kids</option>
                        <option value="Corrine Zeidler">Corrine Zeidler</option>
                        <option value="Dan Corrigan">Dan Corrigan</option>
                        <option value="Dominique Cipriani">Dominique Cipriani</option>
                        <option value="Donette Kingston">Donette Kingston</option>
                        <option value="Ebill Racing">Ebill Racing</option>
                        <option value="Eddie Lopez">Eddie Lopez</option>
                        <option value="Farah Parker">Farah Parker</option>
                        <option value="Innovative Holdings">Innovative Holdings</option>
                        <option value="James Dinda">James Dinda</option>
                        <option value="Jay Bernstein">Jay Bernstein</option>
                        <option value="Jeanne M. Dooley">Jeanne M. Dooley</option>
                        <option value="Jennifer Harrison">Jennifer Harrison</option>
                        <option value="Joe Urraro">Joe Urraro</option>
                        <option value="John Templeton">John Templeton</option>
                        <option value="Kevin Wood">Kevin Wood</option>
                        <option value="Kim DaSilva">Kim DaSilva</option>
                        <option value="Laurie DiGiacomo">Laurie DiGiacomo</option>
                        <option value="Melissa Kirby">Melissa Kirby</option>
                        <option value="Michael Ilardi">Michael Ilardi</option>
                        <option value="Michelle Bernstein">Michelle Bernstein</option>
                        <option value="Mike Crimmins">Mike Crimmins</option>
                        <option value="Richard Nornes">Richard Nornes</option>
                        <option value="Rob Kwasnicki">Rob Kwasnicki</option>
                        <option value="Rory Hedels">Rory Hedels</option>
                        <option value="Tom Tellekamp">Tom Tellekamp</option>
                        <option value="Tommy Ellis">Tommy Ellis</option>
                        <option value="Tony Reis">Tony Reis</option>
                        <option value="Troy Caruso">Troy Caruso</option>
                        <option value="Vanessa Leggard">Vanessa Leggard</option>
                        <option value="Name not on this list">Name not on this list</option>
                        <option value="No one in specific">No one in specific</option>
                        <option value="Not sure of name">Not sure of name</option>
                        <option value="bfm">BFM</option>
                    </select>
                </div>

                <div class="form-group">
                    <label  class="control-label">Business phone number</label>
                    <input  class="form-control" type="text" name="phone" required>
                </div>

                <div class="form-group"
                        >
                    <label class="phone-ext control-label">ext.</label>
                    <input class="form-control" type="text" name="mobile">
                </div>

                <div class="form-group">
                    <label class="control-label">Mobile phone number</label>
                    <input  class="form-control" type="text" name="mobile">
                </div>
        <div class="form-group">
            <div class="text-right">
                <a class="btn btn-orange">Save &amp; Continue</a>
            </div>
        </div><!-- end .form-group -->
   </form>

<%@include file="../modals/winologist.html"%>