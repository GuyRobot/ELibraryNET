<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserSignin.aspx.cs" Inherits="ELibrary.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="px-16 py-8 mx-auto">
        <div class="flex">
            <div class="w-1/2 mx-auto">

                <div class="shadow rounded-lg border px-8 py-4">
                    <div class="card-body">

                        <div class="flex">
                            <div class="w-full">
                                <div class="text-center">
                                    <h3 class="text-3xl font-extrabold">Member Login</h3>
                                </div>
                            </div>
                        </div>

                        <div class="flex">
                            <div class="w-full">
                                <%-- Id --%>
                                <div class="form-group mt-8">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextMemberIdBox" runat="server"
                                        placeholder="Member ID"></asp:TextBox>
                                </div>
                                <%-- Password --%>
                                <div class="form-group mt-3">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextPasswordBox" runat="server"
                                        placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                                <%-- Login Button --%>
                                <div class="flex justify-center mt-4">
                                    <asp:Button CssClass="cursor-pointer mx-auto px-16 py-3 bg-indigo-600 rounded-lg text-white text-sm font-extrabold" ID="LoginButton" OnClick="ButtonMemberLogin_Click" runat="server" Text="Login" />
                                </div>
                               
                                <%-- SignUp Button --%>
                                <div class="flex justify-center mt-4">
                                    <a href="UserSignUp.aspx">
                                        <input class="cursor-pointer px-16 py-3 bg-indigo-600 rounded-lg text-white text-sm font-extrabold" type="button" value="Sign Up" />
                                    </a>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>

                <a href="Homepage.aspx" class="hover:text-indigo-600 text-indigo-500 text-sm italic mt-3 block">Back to home</a>
                <br />
            </div>
        </div>
    </div>
</asp:Content>
