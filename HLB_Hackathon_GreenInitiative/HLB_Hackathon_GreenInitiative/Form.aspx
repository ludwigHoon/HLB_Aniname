<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_WEB.Master" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="HLB_Hackathon_GreenInitiative.Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="sub-header shop-layout-1" style="background-color: #002d62!important">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3" style="color: #fff">Loan Application Form</h3>
    </section>

    <section class="boxed-sm" style="padding-top: 10px; padding-bottom: 44px;">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group organic-form no-radius">
                        <label>Name : </label>
                        <input id="txt_NAME" class="form-control" type="text" placeholder="Name">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group organic-form no-radius">
                        <label>Budget : </label>
                        <input id="txt_BUDGET" class="form-control" type="text" placeholder="Budget">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group organic-form no-radius">
                        <label>Email : </label>
                        <input id="txt_EMAIL" class="form-control" type="text" placeholder="Email">
                    </div>
                </div>
                <div>
                    <div class="col-md-12">
                        <label>Property type</label><br />
                        <input type="radio" name="house_type"> Terrace/Link House Teres/Rumah Berangkai<br/>
                        <input type="radio" name="house_type"> Cluster House Rumah Kelompok<br/>
                        <input type="radio" name="house_type"> Semi Detached Berkembar<br/>
                        <input type="radio" name="house_type"> Bungalow Banglo<br/>
                        <input type="radio" name="house_type"> Townhouse Rumah Bandar<br/>
                        <input type="radio" name="house_type"> Service Apartment Apartment Berservis<br/>
                        <input type="radio" name="house_type"> Condominium Kondominium<br/>
                        <input type="radio" name="house_type"> Apartment Pangsapuri<br/>
                        <input type="radio" name="house_type"> Flat Rumah Pangsa<br/>
                        <input type="radio" name="house_type"> Bungalow Land Tanah Banglo<br/>
                        <input type="radio" name="house_type"> Shop Apartment Pangsapuri Kedai<br/>
                        <input type="radio" name="house_type"> Others Lain-lain:<br/>
                    </div>
                    <div class="col-md-12">
                        <label>Property type</label><br />
                        <input type="number"/> Age of property</input>
                    </div>
                </div>
            </div>
            <br /><br /><br /><br /> 
            <div class="row">
                <div class="col-xs-6 col-md-10 ">
                    <a id="btn_UploadInfo" class="btn submit-btn btn-send" style="font-size: 15px; bottom: 60px; padding: 10px 18px; border: 0; outline: 0; font-weight: bold; position: fixed; color: #FFF; cursor: pointer; background-color: #012b61; text-align: center;">Proceed</a>
                </div>
                <div class="col-xs-6 col-md-2">
                    <button id="btnChat" class="btn submit-btn btn-send contact_btn"
                        style="font-size: 15px; bottom: 60px; padding: 10px 18px; border: 0; outline: 0; font-weight: bold; position: fixed; color: #FFF; cursor: pointer; background-color: #012b61; text-align: center;">
                        Chat</button>
                </div>
                
            </div>
            <br/><div id="chatbot" style="position: absolute; bottom:0px; right:5px;margin-bottom:110px ">
                        <object>
                            <embed width="300" height="400" allow="microphone;" src="https://console.dialogflow.com/api-client/demo/embedded/2186c6fd-370a-4b39-abd4-65eed02c54ee"></embed></object>
                    </div>
            <div class="row">
                <div class="col-xs-12 col-md-10"></div>
                <div class="col-xs-12 col-md-2">
                    
                </div>
            </div>
        </div>
    </section>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#chatbot").hide();
            $("#btnChat").click(function () {
                if ($("#chatbot").is(":visible"))
                    $("#chatbot").hide();
                else
                    $("#chatbot").show();
            });

            $("#btn_UploadInfo").on("click", function () {
                localStorage.setItem("hlb_email", $("#txt_EMAIL").val());

                window.location.href = "/UploadYourInfo.aspx";
            });
        });

//results[0].geometry.location.lat();
//results[0].geometry.location.lng()
    </script>
</asp:Content>
