<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_WEB.Master" AutoEventWireup="true" CodeBehind="UploadYourInfo.aspx.cs" Inherits="HLB_Hackathon_GreenInitiative.UploadYourInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="sub-header shop-layout-1">
        <img class="rellax bg-overlay" src="assets/images/sub-header/09.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">Upload Your Images</h3>
    </section>

    <section class="boxed-sm" style="padding-top:10px;padding-bottom:10px;">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group organic-form no-radius">
                        <label>Profile Picture : </label>
                        <input type='file' id="imgInp" />
                        <img id="blah" src="#" alt="your image" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group organic-form no-radius">
                        <label>Budget : </label>
                        <input id="txt_BUDGET" class="form-control" type="text" placeholder="Budget">
                    </div>
                </div>
                <div class="col-md-12 text-center">
                    <a href="/Map.aspx" class="btn submit-btn btn-send contact_btn" style="font-size: 15px;
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
        function readURL(input) {

            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#imgInp").change(function () {
            readURL(this);
        });
    </script>
</asp:Content>
