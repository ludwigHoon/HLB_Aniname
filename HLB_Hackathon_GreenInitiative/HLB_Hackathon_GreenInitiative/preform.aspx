<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_WEB.Master" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="HLB_Hackathon_GreenInitiative.Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="sub-header shop-layout-1">
        <img class="rellax bg-overlay" src="assets/images/sub-header/09.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">Are you ready?</h3>
    </section>

    <section class="boxed-sm" style="padding-top:10px;padding-bottom:44px;">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group organic-form no-radius">
                        <label>Net Monthly Income : </label>
                        <input id="txt_MONTHLYINCOME" class="form-control" type="text" placeholder="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group organic-form no-radius">
                        <label>Existing Monthly Commitment (RM) : </label>
                        <input id="txt_MONTHLYCOMMITMENT" class="form-control" type="text" placeholder="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group organic-form no-radius">
                        <label>Purchase Price (RM) : </label>
                        <input id="txt_PURCHASE_PRICE" class="form-control" type="text" placeholder="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group organic-form no-radius">
                        <label>We think you are : </label>
                        <input id="txt_Ready" class="form-control" disabled type="text" placeholder="">
                    </div>
                </div>
                <div class="col-md-12 text-center">
                    <a id="btn_Proceed" href="Form.aspx" class="btn submit-btn btn-send contact_btn" style="font-size: 15px;
    bottom: 60px;
    padding: 10px 18px;
    border: 0;
    outline: 0;
    font-weight: bold;
    z-index: 45;
    right: 15px;
    position: fixed;
    color: #FFF;
    cursor: pointer;
    background-color: #012b61;
    text-align: center;">Proceed</a>
                </div>
            </div>
        </div>
    </section>
    <script type="text/javascript">
        //href = "/Map.aspx"
        $(function () {
            $("#txt_MONTHLYINCOME").change(update)
            $("#txt_MONTHLYCOMMITMENT").change(update)
            $("#txt_PURCHASE_PRICE").change(update)
        }); 

        function update () {
            let income = $("#txt_MONTHLYINCOME").val()
            let existing = $("#txt_MONTHLYCOMMITMENT").val()
            let purchase = $("#txt_PURCHASE_PRICE").val()
            if ((income != "") && (existing != "") && (purchase != "")) {
                if (income - existing > purchase) {
                    $("#txt_Ready").val("Yes! You are ready!").css('color', 'green');
                } else {
                    $("#txt_Ready").val("No! We think you need more time to be prepared :/").css('color', 'red');
                }
            }
        };
//results[0].geometry.location.lat();
//results[0].geometry.location.lng()
    </script>
</asp:Content>
