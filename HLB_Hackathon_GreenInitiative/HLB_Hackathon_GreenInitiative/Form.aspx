<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_WEB.Master" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="HLB_Hackathon_GreenInitiative.Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="sub-header shop-layout-1">
        <img class="rellax bg-overlay" src="assets/images/sub-header/09.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">User Details</h3>
    </section>

    <section class="boxed-sm" style="padding-top:10px;padding-bottom:10px;">
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
                </div>
            <div class="row">
             
                <div class="col-xs-6 col-md-8 ">
                    <a href="/Map.aspx" class="btn submit-btn btn-send contact_btn" style="font-size: 15px;
    bottom: 60px;
    padding: 10px 18px;
    border: 0;
    outline: 0;
    font-weight: bold;
    position: fixed;
    color: #FFF;
    cursor: pointer;
    background-color: #012b61;
    text-align: center;">Proceed</a>
                </div>
                <div class="col-xs-6 col-md-2">
                    <button id="btnChat" class="btn submit-btn btn-send contact_btn" 
                        style="font-size: 15px;
    bottom: 60px;
    padding: 10px 18px;
    border: 0;
    outline: 0;
    font-weight: bold;
    position: fixed;
    color: #FFF;
    cursor: pointer;
    background-color: #012b61;
    text-align: center;">Chat</button>
                </div>
                 <div class="col-md-2"></div>
            </div>

            <div class="row">
                <div class="col-xs-12 col-md-10"></div>
                <div class="col-xs-12 col-md-2">
                <div id="chatbot" style="" >
                     <object><embed width="300" height="400" allow="microphone;" src="https://console.dialogflow.com/api-client/demo/embedded/2186c6fd-370a-4b39-abd4-65eed02c54ee"></embed></object>
                </div>
               </div>
            </div>
        </div>
    </section>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#chatbot").hide();
            $("#btnChat").click(function () {
           if($("#chatbot").is(":visible"))
                    $("#chatbot").hide();
            else
                 $("#chatbot").show();
   });
  });

//results[0].geometry.location.lat();
//results[0].geometry.location.lng()
    </script>
</asp:Content>
