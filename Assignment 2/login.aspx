<%@ Page Title="Login" Language="C#" MasterPageFile="~/LoggedOut.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Assignment_2.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main_content">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <h1>Login</h1>
            </div>
            <!-- End of Col -->
        </div>
        <!-- End of Row -->
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <fieldset class="well login_form">
                    <div class="padding_05em">
                        <asp:Label ID="lblEmailLogin" Text="Email:" runat="server" CssClass="sr-only" />
                        <asp:TextBox ID="txtEmailLogin" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
                         <!-- Validating Email for Login -->
                         <asp:RequiredFieldValidator ID="RequiredEmailLogin" ControlToValidate="txtEmailLogin" runat="server" ErrorMessage="Email is Required." CssClass="label label-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="padding_05em">
                        <asp:Label ID="lblPasswordLogin" Text="Password:" runat="server" CssClass="sr-only" />
                        <asp:TextBox ID="txtPasswordLogin" runat="server" placeholder="Password" TextMode="Password" CssClass="form-control"></asp:TextBox>
                         <!-- Validating Password -->
                         <asp:RequiredFieldValidator ID="RequiredPasswordLogin" ControlToValidate="txtPasswordLogin" runat="server" ErrorMessage="Password is Required." Display="Dynamic" CssClass="label label-danger"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <asp:Label ID="lblError" runat="server" CssClass="label label-danger" />
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <asp:Button Text="Login" ID="btnLogin" OnClick="btnLogin_Click" CssClass="btn btn-success btn-block padding_05em" runat="server" />
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
    <!-- End of Main Content -->
</asp:Content>
