<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_WEB.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="HLB_Hackathon_GreenInitiative._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="sub-header shop-layout-1">
        <img class="rellax bg-overlay" src="assets/images/sub-header/09.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">Green Initiative</h3>
    </section>

    <section class="video-section">
        <div class="row" style="padding-bottom: 25px; padding-top: 25px;">
            <div class="col-md-12" style="text-align: center; left: 0; right: 0; margin: auto;">
                <a id="btn_RedirectForm" href="Form.aspx" class="btn btn-info btn-lg" style="background-color:#df2927!important;padding-top:10px;padding-bottom:10px;">
                    <h3 style="color:white;margin-bottom:10px;">Mortgage</h3>
                    <a href="Form.aspx">
                        <object data="./img/house_icon.svg" width="210" height="210" type="image/svg+xml" style="fill: #fff!important;"/>
                    </a>
                </a>
            </div>
        </div>
    </section>
</asp:Content>
