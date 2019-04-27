<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_WEB.Master" AutoEventWireup="true" CodeBehind="LastPage.aspx.cs" Inherits="HLB_Hackathon_GreenInitiative.Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="sub-header shop-layout-1" style="background-color:#002d62!important">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3" style="color:#fff">Mortgage for Millennials</h3>
    </section>

    <section class="boxed-sm" style="padding-top:10px;padding-bottom:10px;">
        <div class="container">
            <div class="row">
                <div class="col-sm-12" >
                    <p style="text-align:center; font-weight:bold; font-size:20px">Do you want to have a further chat with us?</p>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-12" style="text-align:center">
                <button id="btnOnline" class="btn submit-btn btn-send contact_btn">Yes, Online Please</button>
                </div>
            </div>
            <br />
              <div class="row">
                <div class="col-sm-12" style="text-align:center">
                <button id="btnFace" class="btn submit-btn btn-send contact_btn">Yes, face to face</button>
                </div>
            </div>
            <br />
                 <div class="row">
                <div class="col-sm-12" style="text-align:center">
                <button id="btnNo" class="btn submit-btn btn-send contact_btn">No, Thanks. I'm Fine</button>
                </div>
            </div>
            
        </div>
    </section>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnOnline").click(function () {
                
                $.ajax({
                    url: 'https://rapidprod-sendgrid-v1.p.rapidapi.com/mail/send',
                    headers: {
                        'X-RapidAPI-Host': 'rapidprod-sendgrid-v1.p.rapidapi.com',
                        'X-RapidAPI-Key': 'b46146b773msh2a3d48640aa271bp1070edjsn26e09aad7368',
                        'Content-Type': 'application/json'
                    },
                    method: 'POST',
                    dataType: 'json',
                    data:JSON.stringify({
                         "personalizations": [{ "to": [{ "email":"kelvinsoon1123@hotmail.com" }], "subject": "Application Received HLB" }], "from": { "email": "xanthemc@yahoo.com" }, "content": [{ "type": "text/plain", "value": "Hi, we have received your mortgage application form. We will contact you briefly." }] }
                          ),
                    success: function (data) {
                        console.log('success: ' + data.match);
                        var txt;
                    }
                });
                var r = confirm("Do you also want to opt out of receiving monthly statement?");
                        if (r == true) {
                          txt = "We will take that in mind";
                        } else {
                          txt = "Maybe next time :/";
                        }
                alert(txt);
            });

             $("#btnFace").click(function () {
                
                $.ajax({
                    url: 'https://rapidprod-sendgrid-v1.p.rapidapi.com/mail/send',
                    headers: {
                        'X-RapidAPI-Host': 'rapidprod-sendgrid-v1.p.rapidapi.com',
                        'X-RapidAPI-Key': 'b46146b773msh2a3d48640aa271bp1070edjsn26e09aad7368',
                        'Content-Type': 'application/json'
                    },
                    method: 'POST',
                    dataType: 'json',
                    data:JSON.stringify({
                         "personalizations": [{ "to": [{ "email":localStorage.getItem("hlb_email") }], "subject": "Application Received HLB" }], "from": { "email": "xanthemc@yahoo.com" }, "content": [{ "type": "text/plain", "value": "Hi, we have received your mortgage application form. We would contact you about the results." }] }
                          ),
                    success: function (data) {
                        console.log('success: ' + data.match);
                    }
                 });
                 var r = confirm("Do you also want to opt out of receiving monthly statement?");
                        if (r == true) {
                            txt = "We will take that in mind";
                        } else {
                          txt = "Maybe next time :/";
                 }
                 alert(txt);
            });

             $("#btnNo").click(function () {
                
                $.ajax({
                    url: 'https://rapidprod-sendgrid-v1.p.rapidapi.com/mail/send',
                    headers: {
                        'X-RapidAPI-Host': 'rapidprod-sendgrid-v1.p.rapidapi.com',
                        'X-RapidAPI-Key': 'b46146b773msh2a3d48640aa271bp1070edjsn26e09aad7368',
                        'Content-Type': 'application/json'
                    },
                    method: 'POST',
                    dataType: 'json',
                    data:JSON.stringify({
                         "personalizations": [{ "to": [{ "email":"kelvinsoon1123@hotmail.com" }], "subject": "Application Received HLB" }], "from": { "email": "xanthemc@yahoo.com" }, "content": [{ "type": "text/plain", "value": "Hi, we have received your mortgage application form. We will contact you briefly." }] }
                          ),
                    success: function (data) {
                        console.log('success: ' + data.match);
                    }
                });
                 var r = confirm("Do you also want to opt out of receiving monthly statement?");
                        if (r == true) {
                          txt = "We will take that in mind";
                        } else {
                          txt = "Maybe next time :/";
                 }
                 alert(txt);
            });
  });

//results[0].geometry.location.lat();
//results[0].geometry.location.lng()
    </script>
</asp:Content>
