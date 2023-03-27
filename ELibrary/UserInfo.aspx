<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="ELibrary.UserInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="w-full px-8 py-4">
        <div class="flex flex-col space-y-6">
            <div class="w-11/12 mx-auto">
                <div class="shadow border rounded-lg px-6 py-4">
                    <div class="card-body">
                        <div class="flex">
                            <div class="w-full">
                                <center>
                                    <img width="64" src="Assets/Images/book.png" />
                                </center>
                            </div>
                        </div>
                        <div class="flex">
                            <div class="w-full text-center">
                                <h4 class="mt-3">Your profile</h4>
                                <div class="mt-3">
                                    <span>Account status - </span>
                                    <asp:Label class="bg-blue-600 text-white rounded-3xl px-3 py-1 text-xs capitalize" ID="LabelStatus" runat="server" Text="Your status"></asp:Label>
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
                            <div class="w-1/3">
                                <label class="block text-sm font-medium text-gray-700">Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextMemberIdBox" runat="server"
                                        placeholder="User ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="w-1/3">
                                <label class="block text-sm font-medium text-gray-700">Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextOldPasswordBox" runat="server"
                                        placeholder="Old Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                            <div class="w-1/3">
                                <label class="block text-sm font-medium text-gray-700">Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextPasswordBox" runat="server"
                                        placeholder="New Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%--  --%>

                        <div class="flex mt-6">
                            <div class="w-8/12 mx-auto">
                                <center>
                                    <div class="form-group">
                                        <asp:Button class="cursor-pointer px-16 py-3 bg-indigo-600 rounded-lg text-white text-sm font-extrabold" ID="ButtonUpdate" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
                                    </div>
                                </center>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="/" class="hover:text-indigo-600 text-indigo-500 text-sm italic mt-3 block">Back to home</a>
            </div>


            <div class="w-11/12 mx-auto">
                <div class="shadow border rounded-lg px-6 py-4">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="64" src="Assets/Images/book.png" />
                                </center>
                            </div>
                        </div>
                        <div class="flex">
                            <div class="w-full space-y-3 flex flex-col items-center justify-center">
                                <h4 class="mt-3">Your issued books</h4>
                                <asp:Label class="bg-indigo-600 text-white rounded-3xl px-3 py-1 text-xs" ID="LabelBookInfo" runat="server" Text="Your books info"></asp:Label>
                            </div>
                        </div>

                        <div class="flex mt-4">
                            <div class="w-full">
                                <asp:GridView class="w-full text-center table table-striped table-bordered" ID="GridViewIssuedBook" runat="server" OnRowDataBound="GridViewIssuedBook_RowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
