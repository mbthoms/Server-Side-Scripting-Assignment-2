<%@ Page Title="Food Input" Language="C#" MasterPageFile="~/LoggedIn.Master" AutoEventWireup="true" CodeBehind="Food_input.aspx.cs" Inherits="Assignment_2.WebForm1" %>

<%@ Register Src="~/auth.ascx" TagPrefix="uc1" TagName="auth" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:auth runat="server" ID="auth" />
   <div class="main_content">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <h1>Add a Food Item:</h1>
        </div>-
        <!--End of column-->

    <fieldset class="well login_form">
        <div class="padding_05em">
                <!--Input Food-->
            <asp:Label ID="lblFoodName" Text="Food Name:" runat="server" CssClass="sr-only" />
            <asp:TextBox ID="txtFoodName" runat="server" placeholder="Food Name" CssClass="form-control"></asp:TextBox>
                <!--Validate-->
            <asp:RequiredFieldValidator  runat="server" ErrorMessage="Please Enter a Food Name."  Display="Dynamic" ControlToValidate="txtFoodName" CssClass="label label-danger"></asp:RequiredFieldValidator>
        </div>
        <div class="padding_05em">
                <!--Input Calories-->
            <asp:Label ID="lblCalories" Text="Calories:" runat="server" CssClass="sr-only" />
            <asp:TextBox ID="txtCalories" runat="server" placeholder="Calories" CssClass="form-control"></asp:TextBox>
                <!--Validate-->
            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Please Enter the Amount of Calories."  CssClass="label label-danger" ControlToValidate="txtCalories"></asp:RequiredFieldValidator>
            <asp:RangeValidator runat="server"  Display="Dynamic" ErrorMessage="Please Enter a Value Between 1 and 5000." MinimumValue="1" MaximumValue="5000" ControlToValidate="txtCalories" Type="Double" CssClass="label label-danger"></asp:RangeValidator>
        </div>
        <div class="padding_05em">
                <!--Input Date-->
            <asp:Label ID="lblDate" Text="Date:" runat="server" CssClass="sr-only" />
            <asp:TextBox ID="txtDate" runat="server" placeholder="Date of Entry (mm-dd-yyyy)" CssClass="form-control"></asp:TextBox>
                <!--Validate-->
            <asp:RequiredFieldValidator  runat="server" ErrorMessage="Please Enter a Date."  Display="Dynamic" ControlToValidate="txtDate" CssClass="label label-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="padding_05em">
                <!--add button-->
            <asp:Button ID="btnAddFood" text="Save Food" runat="server" OnClick="btnAddFood_Click" CssClass="btn btn-success btn-block padding_05em" />
   
        </div>
     </fieldset>
    </div> <!--End of main content-->
</asp:Content>