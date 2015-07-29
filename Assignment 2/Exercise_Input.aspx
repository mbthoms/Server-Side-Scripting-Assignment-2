<%@ Page Title="" Language="C#" MasterPageFile="~/LoggedIn.Master" AutoEventWireup="true" CodeBehind="exercise_input.aspx.cs" Inherits="Assignment_2.exercise_input" %>

<%@ Register Src="~/auth.ascx" TagPrefix="uc1" TagName="auth" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:auth runat="server" ID="auth" />
    <div class="main_content">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <h1>Add an Exercise:</h1>
        </div> <!-- End of Col -->
        <fieldset class="well login_form">
            <div class="padding_05em">
                <!-- Input Exercise -->
                <asp:Label Text="Exercise Name:" ID="lblExerciseName" CssClass="sr-only" runat="server" />
                <asp:TextBox ID="txtExerciseName" runat="server" CssClass="form-control" placeholder="Exercise Name"/>
                <!--Validate-->
                <asp:RequiredFieldValidator runat="server" ErrorMessage="Please Enter an Exercise." CssClass="Label label-danger" Display="Dynamic"  ControlToValidate="txtExerciseName"></asp:RequiredFieldValidator>
            </div>
            <div class="padding_05em">
                <!--input reps-->
                <asp:Label Text="Reps:" ID="lblExerciseReps" CssClass="sr-only" runat="server" />
                <asp:TextBox ID="txtReps" runat="server" CssClass="form-control" placeholder="Reps" />
                <!--Validate-->
                <asp:RequiredFieldValidator runat="server" ErrorMessage="Please Enter a Rep Amount." CssClass="Label label-danger" Display="Dynamic" ControlToValidate="txtReps"></asp:RequiredFieldValidator>
                <asp:RangeValidator runat="server" ErrorMessage="Please Enter an Amount from 1 to 100." Display="Dynamic"  ControlToValidate="txtReps" MinimumValue="1" MaximumValue="100" Type="Integer" CssClass="label label-danger"></asp:RangeValidator>
            </div>
            <div class="padding_05em">
                <!--Input Date-->
                <asp:Label Text="Date:" ID="lblDate" CssClass="sr-only" runat="server" />
                <asp:TextBox ID="txtExerciseDate" runat="server" Placeholder="Date of Entry (mm-dd-yyyy)" CssClass="form-control"/>
                <!--Validate-->
                <asp:RequiredFieldValidator runat="server" ErrorMessage="Please Enter a Date" ControlToValidate="txtExerciseDate" Display="Dynamic" ></asp:RequiredFieldValidator>
            </div>
            <div class="padding_05em">
                <!--Add Button -->
                <asp:Button ID="btnAddExercise" Text="Save Exercise" runat="server" CssClass="btn btn-success btn-block padding_05em" OnClick="btnAddExercise_Click" />

            </div>
        </fieldset>

    </div>

</asp:Content>
