<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminMemberManagement.aspx.cs" Inherits="ELibrary.AdminMemberManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        $(document).ready(function () {
            // ReSharper disable UseOfImplicitGlobalInFunctionScope
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        })
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="w-full px-8 py-4">
        <div class="flex flex-col">
            <%-- Left Panel --%>
            <div class="w-11/12 mx-auto">

                <%--  --%>
                <div class="shadow border rounded-lg px-6 py-4">
                    <div class="card-body">

                        <div class="flex">
                            <div class="w-full text-center">
                                <h4 class="text-3xl font-extrabold">Member Detail</h4>
                            </div>
                        </div>

                        <div class="flex">
                            <div class="w-full text-center">
                                <%-- ReSharper disable once Asp.Image --%>
                                <img src="Assets/Images/book.png" alt="User Image" width="64" />
                            </div>
                        </div>

                        <%-- Author ID and Name --%>

                        <div class="flex mt-3 space-x-3">
                            <div class="w-3/12">
                                <label class="block text-sm font-medium text-gray-700">Member ID</label>

                                <div class="form-group">
                                    <div class="flex space-x-2">
                                        <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextMemberIDBox" runat="server"
                                            placeholder="ID">
                                        </asp:TextBox>
                                        <asp:LinkButton class="mt-1 px-3 py-2 bg-indigo-600 rounded-lg text-white text-sm" ID="LinkGoButton" runat="server" ValidateRequestMode="Enabled" OnClick="ButtonGo_Click" ViewStateMode="Disabled">
                                            Go
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <%--  --%>
                            <div class="w-3/12">
                                <label class="block text-sm font-medium text-gray-700">Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextFullNameBox" runat="server"
                                        placeholder="Full Name" ReadOnly="True">
                                    </asp:TextBox>
                                </div>
                            </div>

                            <%--  --%>
                            <div class="w-6/12">
                                <label class="block text-sm font-medium text-gray-700">Account Status</label>
                                <div class="form-group">
                                    <div class="flex space-x-2">

                                        <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextAccountStatusBox" runat="server"
                                            placeholder="Status" ReadOnly="true">
                                        </asp:TextBox>

                                        <asp:LinkButton class="mt-1 px-3 py-2 bg-indigo-600 rounded-lg text-white text-sm" OnClick="ButtonActiveMember_Click" runat="server" Text="A">
                                            <span class="material-icons text-sm">check_circle</span>
                                        </asp:LinkButton>
                                        <asp:LinkButton class="mt-1 px-3 py-2 bg-indigo-600 rounded-lg text-white text-sm" OnClick="ButtonPendingMember_Click" runat="server" Text="P">
                                            <span class="material-icons-outlined material-icons text-sm">pause_circle</span>
                                        </asp:LinkButton>
                                        <asp:LinkButton class="mt-1 px-3 py-2 bg-indigo-600 rounded-lg text-white text-sm" OnClick="ButtonDeActiveMember_Click" runat="server" Text="D">
                                            <span class="material-icons-outlined material-icons text-sm">timelapse</span>                                  
                                        </asp:LinkButton>
                                    </div>


                                </div>
                            </div>

                        </div>

                        <%--  --%>

                        <div class="flex mt-3 space-x-3">
                            <%--  --%>
                            <div class="w-3/12">
                                <label class="block text-sm font-medium text-gray-700">DOB</label>
                                <div class="form-group">
                                    <div class="flex space-x-2">
                                        <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextDOBBox" runat="server"
                                            placeholder="DOB">
                                        </asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <%--  --%>
                            <div class="w-4/12">
                                <label class="block text-sm font-medium text-gray-700">Contact No</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextContactNoBox" runat="server"
                                        placeholder="No">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <%--  --%>
                            <div class="w-5/12">
                                <label class="block text-sm font-medium text-gray-700">Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextEmailBox" runat="server"
                                        placeholder="Email">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%-- State and Date and --%>

                        <div class="flex mt-3 space-x-3">
                            <%--  --%>
                            <div class="w-4/12">
                                <label class="block text-sm font-medium text-gray-700">State</label>
                                <div class="form-group">
                                    <div class="flex space-x-2">
                                        <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextStateBox" runat="server"
                                            placeholder="State">
                                        </asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <%--  --%>
                            <div class="w-4/12">
                                <label class="block text-sm font-medium text-gray-700">City</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextCityBox" runat="server"
                                        placeholder="City">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <%--  --%>
                            <div class="w-4/12">
                                <label class="block text-sm font-medium text-gray-700">Pin Code</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextPinCodeBox" runat="server"
                                        placeholder="Pin Code">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <%--  --%>

                        <div class="flex mt-3 space-x-3">
                            <%--  --%>
                            <div class="w-full">
                                <label class="block text-sm font-medium text-gray-700">Full Postal Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextFullAddressBox" runat="server"
                                        placeholder="Full Postal Address" TextMode="MultiLine" Rows="2" ReadOnly="True">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <%-- Button Control --%>

                        <div class="flex space-x-3 mt-3">
                            <div class="w-full mx-auto">
                                <asp:Button class="cursor-pointer px-8 py-3 bg-indigo-600 rounded-lg text-white text-sm font-extrabold" ID="DeleteButton" runat="server" Text="Delete" />
                            </div>
                        </div>
                    </div>
                </div>

                <br />
            </div>

            <%-- Right Panel --%>
            <div class="w-11/12 mx-auto">

                <%--  --%>
                <div class="shadow border rounded-lg px-6 w-full py-4">
                    <div class="card-body">

                        <div class="flex">
                            <div class="w-full">
                                <div class="text-center">
                                    <h4 class="text-3xl font-extrabold">Member List</h4>
                                </div>
                            </div>
                        </div>

                        <div class="flex mt-3">
                            <asp:SqlDataSource ID="SqlDataMemberSource" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                            <div class="w-full">
                                <asp:GridView class="w-full table-bordered table table-striped mx-auto" DataSourceID="SqlDataMemberSource" ID="GridMemberView" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="dob" HeaderText="DOB" SortExpression="dob" />
                                        <asp:BoundField DataField="contact_no" HeaderText="Contact" SortExpression="contact_no" />
                                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                        <asp:BoundField DataField="pincode" HeaderText="Pin Code" SortExpression="pincode" />
                                        <asp:BoundField DataField="full_address" HeaderText="Full Address" SortExpression="full_address" />
                                        <asp:BoundField DataField="member_id" HeaderText="ID" SortExpression="member_id" />
                                        <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                                        <asp:BoundField DataField="account_status" HeaderText="Status" SortExpression="account_status" />
                                    </Columns>

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

                <a href="/" class="hover:text-indigo-600 text-indigo-500 text-sm italic mt-3 block">Back to home</a>
                <br />
            </div>
        </div>
    </div>


</asp:Content>
