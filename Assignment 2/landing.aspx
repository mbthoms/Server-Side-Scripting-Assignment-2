<%@ Page Title="Landing | Fit and Fun" Language="C#" MasterPageFile="~/LoggedOut.Master" AutoEventWireup="true" CodeBehind="landing.aspx.cs" Inherits="Assignment_2.landing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
        <div class="main_content jumbotron">
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <h1>Welcome to Fit and Fun!</h1>
                </div>
            </div>
            <!-- End of Row -->
            <div class="row">
                <div class="col-sm-12 col-md-6 col-lg-6">
                    <p>Bring us along on your fitness journey to increase your chances of building strength and decreasing fat.</p>
                    <fieldset class="padding_left_right_25per">
                        <h3>Sign Up Below:</h3>
                        <div class="padding_05em">
                            <asp:Label ID="lblFName" Text="First Name:" runat="server" CssClass="sr-only" />
                            <asp:TextBox ID="txtFName" runat="server" placeholder="First Name" CssClass="form-control"></asp:TextBox>
                            <!-- Validating First Name -->
                            <asp:RequiredFieldValidator ID="RequiredFName" ControlToValidate="txtFName" runat="server" ErrorMessage="First Name is Required." Display="Dynamic" CssClass="label label-danger"></asp:RequiredFieldValidator>
                        </div>
                        <div class="padding_05em">
                            <asp:Label ID="lblLName" Text="Last Name:" runat="server" CssClass="sr-only" />
                            <asp:TextBox ID="txtLName" runat="server" placeholder="Last Name" CssClass="form-control"></asp:TextBox>
                            <!-- Validating Last Name -->
                            <asp:RequiredFieldValidator ID="RequiredLName" ControlToValidate="txtLName" runat="server" ErrorMessage="Last Name is Required." Display="Dynamic" CssClass="label label-danger"></asp:RequiredFieldValidator>
                        </div>
                        <div class="padding_05em">
                            <asp:Label ID="lblEmail" Text="Email:" runat="server" CssClass="sr-only" />
                            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
                             <!-- Validating Password -->
                            <asp:RequiredFieldValidator ID="RequiredEmail" ControlToValidate="txtEmail" runat="server" ErrorMessage="Email is Required." Display="Dynamic" CssClass="label label-danger"></asp:RequiredFieldValidator>
                        </div>
                         <div class="padding_05em">
                            <asp:Label ID="lblPassword" Text="Password:" runat="server" CssClass="sr-only" />
                            <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password" CssClass="form-control"></asp:TextBox>
                             <!-- Validating Password -->
                            <asp:RequiredFieldValidator ID="RequiredPassword" ControlToValidate="txtPassword" runat="server" ErrorMessage="Password is Required." Display="Dynamic" CssClass="label label-danger"></asp:RequiredFieldValidator>
                        </div>
                        <div class="padding_05em">
                            <asp:Label ID="lblConfirmPassword" Text="Confirm Password:" runat="server" CssClass="sr-only" />
                            <asp:TextBox ID="txtConfirmPassword" runat="server" placeholder="Confirm Password" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            <!-- Comparing the Passwords. -->
                            <asp:CompareValidator ID="ComparePassword" runat="server" ControlToValidate="txtPassword" ControlToCompare="txtConfirmPassword" ErrorMessage="Password isn't the same. Please check passwords and submit again." Display="Dynamic" CssClass="label label-danger"></asp:CompareValidator>
                            <!-- Validating Compared Password -->
                            <asp:RequiredFieldValidator ID="RequiredComparedPassword" ControlToValidate="txtConfirmPassword" runat="server" ErrorMessage="Matching Password is Required." Display="Dynamic" CssClass="label label-danger"></asp:RequiredFieldValidator>
                        </div>
                        <div class="padding_05em">
                            <asp:Button ID="btnSignUp" Text="Sign Up" OnClick="btnSignUp_Click" runat="server" CssClass="btn btn-success btn-block" />
                        </div>
                    </fieldset>
                </div>
                <!-- End of Col -->
                <div class="col-sm-12 col-md-6 col-lg-6">
                    <img src="img/jumping.jpg" alt="Man jumps around at dusk." />
                </div>
                <!-- End of Col -->
            </div>
            <!-- End of Row -->
        </div>
        <!-- End of Main Content -->
    </body>
</asp:Content>
