<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserSignup.aspx.cs" Inherits="ELibrary.UserSignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="px-16 py-8">
        <div class="flex">
            <div class="w-8/12 mx-auto">

                <div class="shadow border rounded-lg px-8 py-4">
                    <div class="card-body">

                        <div class="flex">
                            <div class="w-full">
                                <div class="text-center">
                                    <h4 class="text-3xl font-extrabold">User Registration</h4>
                                </div>
                            </div>
                        </div>

                        <%-- Full Name & Date Birth --%>

                        <div class="flex mt-6 space-x-3">
                            <div class="w-1/2">
                                <label class="block text-sm font-medium text-gray-700">Full Name </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextFullNameBox" runat="server"
                                        placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="w-1/2">
                                <label class="block text-sm font-medium text-gray-700">Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextDateOfBirthBox" runat="server"
                                        placeholder="Date of Birth"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%-- Contact Info --%>
                        <div class="flex space-x-3 mt-3">
                            <div class="w-1/2">
                                <label class="block text-sm font-medium text-gray-700">Contact No</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextContactNoBox" runat="server"
                                        placeholder="Contact No"></asp:TextBox>
                                </div>
                            </div>
                            <div class="w-1/2">
                                <label class="block text-sm font-medium text-gray-700">Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextEmailBox" runat="server"
                                        placeholder="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%-- Address --%>
                        <div class="flex space-x-3 mt-3">
                            <div class="w-1/3">
                                <label class="block text-sm font-medium text-gray-700">State</label>
                                <div class="form-group">
                                    <%--  cSpell:disable  --%>
                                    <asp:DropDownList CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="DropDownStateList" runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh" />
                                        <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh" />
                                        <asp:ListItem Text="Assam" Value="Assam" />
                                        <asp:ListItem Text="Bihar" Value="Bihar" />
                                        <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
                                        <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                                        <asp:ListItem Text="Goa" Value="Goa" />
                                        <asp:ListItem Text="Gujarat" Value="Gujarat" />
                                        <asp:ListItem Text="Haryana" Value="Haryana" />
                                        <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh" />
                                        <asp:ListItem Text="Jammu and Kashmir" Value="Jammu and Kashmir" />
                                        <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
                                        <asp:ListItem Text="Karnataka" Value="Karnataka" />
                                        <asp:ListItem Text="Kerala" Value="Kerala" />
                                        <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh" />
                                        <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
                                        <asp:ListItem Text="Manipur" Value="Manipur" />
                                        <asp:ListItem Text="Meghalaya" Value="Meghalaya" />
                                        <asp:ListItem Text="Mizoram" Value="Mizoram" />
                                        <asp:ListItem Text="Nagaland" Value="Nagaland" />
                                        <asp:ListItem Text="Odisha" Value="Odisha" />
                                        <asp:ListItem Text="Punjab" Value="Punjab" />
                                        <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                                        <asp:ListItem Text="Sikkim" Value="Sikkim" />
                                        <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu" />
                                        <asp:ListItem Text="Telangana" Value="Telangana" />
                                        <asp:ListItem Text="Tripura" Value="Tripura" />
                                        <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh" />
                                        <asp:ListItem Text="Uttarakhand" Value="Uttarakhand" />
                                        <asp:ListItem Text="West Bengal" Value="West Bengal" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="w-1/3">
                                <label class="block text-sm font-medium text-gray-700">City</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextCityBox" runat="server"
                                        placeholder="City"></asp:TextBox>
                                </div>
                            </div>
                            <div class="w-1/3">
                                <label class="block text-sm font-medium text-gray-700">Pin Code</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextPinCodeBox" runat="server"
                                        placeholder="Pin Code"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <%--  --%>

                        <%-- Full Address --%>

                        <div class="flex mt-3">
                            <div class="w-full">
                                <label class="block text-sm font-medium text-gray-700">Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextFullAddressBox" runat="server"
                                        placeholder="Full Address" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%-- Login Credentials --%>

                        <div class="flex mt-3">
                            <div class="w-full text-center">
                                <span class="bg-indigo-600 text-white rounded-3xl px-3 py-1 text-xs">Login Credentials</span>
                            </div>
                        </div>


                        <%-- Credential --%>

                        <div class="flex space-x-3 mt-3">
                            <div class="w-1/2">
                                <label class="block text-sm font-medium text-gray-700">Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextMemberIdBox" runat="server"
                                        placeholder="User ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="w-1/2">
                                <label class="block text-sm font-medium text-gray-700">Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextPasswordBox" runat="server"
                                        placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%--  --%>

                        <div class="flex mt-8">
                            <div class="w-full">
                                <div class="form-group text-center">
                                    <asp:Button class="cursor-pointer px-16 py-3 bg-indigo-600 rounded-lg text-white text-sm font-extrabold" ID="SignUpButton" runat="server" Text="SignUp" OnClick="ButtonSignUp_Click" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <a href="/" class="hover:text-indigo-600 text-indigo-500 text-sm italic mt-3 block">Back to home</a>
                <br />
            </div>
        </div>
    </div>

</asp:Content>
