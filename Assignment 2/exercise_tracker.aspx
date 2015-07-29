<%@ Page Title="Exercise Tracker | Fit and Fun" Language="C#" MasterPageFile="~/LoggedIn.Master" AutoEventWireup="true" CodeBehind="exercise_tracker.aspx.cs" Inherits="Assignment_2.exercise_tracker" %>

<%@ Register Src="~/auth.ascx" TagPrefix="uc1" TagName="auth" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:auth runat="server" ID="auth" />
    <div class="main_content">
        <h1>Exercise Tracker</h1>
        <div class=" text-center padding_05em">
            <a href="exercise_input.aspx" class="btn btn-success">Add an Exercise</a>
        </div>

        <asp:GridView runat="server" ID="grdExercise" CssClass="table table-striped table-hover" AutoGenerateColumns="false" OnRowDeleting="grdExercise_RowDeleting" DataKeyNames="exercise_id">
            <Columns>
                <asp:BoundField DataField="user_id" HeaderText="User ID" Visible="false" />
                <asp:BoundField DataField="exercise_id" HeaderText="Exercise ID" Visible="false" />
                <asp:BoundField DataField="exercise_name" HeaderText="Name of Exercise" />
                <asp:BoundField DataField="exercise_rep" HeaderText="Reps" />
                <asp:BoundField DataField="exercise_date" HeaderText="Date of Entry" DataFormatString="{0:MM-dd-yyyy}" />
                <asp:HyperLinkField HeaderText="Edit" Text="Edit" DataNavigateUrlFields="exercise_id" DataNavigateUrlFormatString="exercise_input.aspx?exercise_id={0}" ControlStyle-CssClass="btn btn-primary" />
                <asp:CommandField ShowDeleteButton="true" DeleteText="Delete" HeaderText="Delete" ControlStyle-CssClass="btn btn-danger" />
            </Columns>
        </asp:GridView>
</asp:Content>
