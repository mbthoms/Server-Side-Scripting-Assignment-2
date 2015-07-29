<%@ Page Title="" Language="C#" MasterPageFile="~/LoggedIn.Master" AutoEventWireup="true" CodeBehind="login_landing.aspx.cs" Inherits="Assignment_2.WebForm3" %>

<%@ Register Src="~/auth.ascx" TagPrefix="uc1" TagName="auth" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:auth runat="server" ID="auth" />
     <div class="main_content">
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <h1>What Would You Like To Track?</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-6 col-lg-6 text-center">
                    <h2 class="text-center">Food</h2>
                    <a href="food_tracker.aspx" title="Link to the food tracking table."><img src="img/grapes.jpeg" alt="image of man holding grapes." /></a>
                </div>

                <div class="col-sm-12 col-md-6 col-lg-6 text-center">
                    <h2 class="text-center">Exercise</h2>
               <a href="exercise_tracker.aspx" title="Link to the exercise tracking table."><img src="img/rawr.jpg" alt="Woman prepares for battle." /></a>
                </div>
            </div>
        </div>
</asp:Content>
