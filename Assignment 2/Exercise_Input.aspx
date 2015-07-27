<%@ Page Title="Exercise Input" Language="C#" MasterPageFile="~/LoggedIn.Master" AutoEventWireup="true" CodeBehind="Exercise_Input.aspx.cs" Inherits="Assignment_2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="main_content">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <h1>Add an Exercise:</h1>
        </div>-
        <!--End of column-->

    <fieldset class="well login_form">
        <div>
                <!--Input Date-->
            <asp:Label ID="lblExerciseDate" Text="Date:" runat="server" CssClass="sr-only" />
            <asp:TextBox ID="txtExerciseDate" runat="server" placeholder="Date" CssClass="form-control"></asp:TextBox>
                <!--Validate-->
            <asp:RequiredFieldValidator  runat="server" ErrorMessage="Please Enter a Date."  Display="Dynamic" ControlToValidate="txtExerciseDate" CssClass="label label-danger"></asp:RequiredFieldValidator>
        </div>
        <div>
                <!--Input Food-->
            <asp:Label ID="lblExerciseName" Text="Exercise Name:" runat="server" CssClass="sr-only" />
            <asp:TextBox ID="txtExerciseName" runat="server" placeholder="Exercise Name"  CssClass="form-control"></asp:TextBox>
                <!--Validate-->
            <asp:RequiredFieldValidator  runat="server" ErrorMessage="Exercise Name."  Display="Dynamic" ControlToValidate="txtExerciseName" CssClass="label label-danger"></asp:RequiredFieldValidator>
        </div>
        <div>
                <!--Input Calories-->
            <asp:Label ID="lblreps" Text="Reps:" runat="server" CssClass="sr-only" />
            <asp:TextBox ID="txtReps" runat="server" placeholder="Reps" CssClass="form-control"></asp:TextBox>
                <!--Validate-->
            <asp:RequiredFieldValidator runat="server" ErrorMessage="Please Enter the Amount of Reps."  CssClass="label label-danger" ControlToValidate="txtReps"></asp:RequiredFieldValidator>
            <asp:RangeValidator runat="server"  Display="Dynamic" ErrorMessage="Please Enter a Value Between 1 and 100." MinimumValue="1" MaximumValue="100" ControlToValidate="txtReps" Type="Integer" CssClass="label label-danger"></asp:RangeValidator>
        </div>

        <div>
                <!--add button-->
            <asp:Button ID="btnAddExercise" text="Add Exercise" runat="server" CssClass="btn btn-success btn-block padding_05em" />
   
        </div>
     </fieldset>
    </div> <!--End of main content-->
</asp:Content>