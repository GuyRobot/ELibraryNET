<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ELibrary._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

      <div id="#home" class="relative w-full min-h-screen flex flex-row" style="min-height: 100vh; background: url('Assets/Images/bgIMG.png')">
        <div class="p-0 flex-1 w-full flex-col flex justify-center items-center">

            <div class='flex-1 w-11/12 mx-auto h-full flex-row pt-12 px-2 flex' style="min-height: 100vh">
                <div>
                    <div class='flex flex-col justify-start items-start h-full my-0 mx-4' style="flex: 0.65">
                        <div class='w-full flex justify-end items-end flex-col'>
                            <div class='px-8 py-4 bg-white rounded-xl flex-row w-auto shadow-sm flex justify-center items-center'>
                                <span>👋</span>
                                <div class='ml-4'>
                                    <p class='p-text'>Hello, I am</p>
                                    <h1 class='text-4xl font-extrabold text-center text-gray-900 capitalize'>UdoTask</h1>
                                </div>
                            </div>
                            <div class='px-8 py-4 bg-white rounded-xl flex-col mt-12 w-auto shadow-sm flex justify-center items-center'>
                                <p class='text-sm text-gray-600 w-full text-right'>
                                    <span>The productivity app</span>
                                </p>
                                <p class='text-sm text-gray-600 w-full text-right'>
                                    <span>to keep track of your tasks</span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class='flex-1 h-full flex justify-end items-end relative'>
                    <div class='w-full invisible lg:visible absolute transform -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2 px-8 z-10'>
                        <h1 class='text-6xl text-center font-black'>The UdoTask App</h1>
                        <p class='mt-8 w-1/2 text-2xl text-center mx-auto'>Want to keep track your events. Try UdoTask to help you write for enjoying your moments</p>
                        <div class='mx-auto mt-8 w-48'>
                            <playbutton />
                        </div>
                    </div>

                    <img class='absolute left-0 right-0 bottom-0 top-0 z-0 w-full h-[90%] top-0 w-full object-contain z-10' style="height: 90%"
                        src="Assets/Images/circle.svg"
                        alt="profile_circle" />

                </div>
            </div>


        </div>
    </div>






    <!--
    <section>
        <img src="imgs/home-bg.jpg" alt="Home Image" class="img-fluid" />
    </section>
        -->

    <section class="py-8">
        <div class="container mx-auto">
            <div class="flex">
                <div class="col-12 text-center mx-auto  ">
                    <center>
                        <h2 class="text-xl">Our Features</h2>
                        <p class="text-3xl"><b>Our 3 Primary Features</b></p>
                    </center>
                </div>
            </div>

            <div class="flex mt-4">
                <div class="w-1/3 text-center flex flex-col justify-center items-center">
                    <div class="text-center m-2 flex justify-center items-center flex-col w-full">
                        <span class='flex justify-center items-center bg-gradient-to-b rounded-full p-2 h-24 w-24 text-transparent from-violet-800 to-indigo-800 bg-indigo-600'>
                            <span class="material-icons text-white text-4xl">list_alt
                            </span>
                        </span>
                        <p class='p-text mt-4 text-center text-3xl font-bold text-gray-800 whitespace-pre-line'>
                            Make things
                            simpler
                        </p>
                        <p class='p-text mt-4 text-center px-8'>Make tasks simpler with task list, steps and reminder to remind you doing tasks.</p>
                    </div>
                </div>
                <div class="w-1/3 text-center flex flex-col justify-center items-center">
                    <div class="text-center m-2 flex justify-center items-center flex-col w-full">
                        <span class='flex justify-center items-center bg-gradient-to-b rounded-full p-2 h-24 w-24 text-transparent from-violet-800 to-indigo-800 bg-indigo-600'>
                            <span class="material-icons text-white text-4xl">history_edu
                            </span>
                        </span>
                        <p class='p-text mt-4 text-center text-3xl font-bold text-gray-800 whitespace-pre-line'>Stay organize, more focus</p>
                        <p class='p-text mt-4 text-center px-8'>Explore rich features todo task list to keep organize. Write down tasks and steps to make it practical</p>
                    </div>
                </div>
                <div class="w-1/3 text-center flex flex-col justify-center items-center">
                    <div class="text-center m-2 flex justify-center items-center flex-col w-full">
                        <span class='flex justify-center items-center bg-gradient-to-b rounded-full p-2 h-24 w-24 text-transparent from-violet-800 to-indigo-800 bg-indigo-600'>
                            <span class="material-icons text-white text-4xl">calendar_month
                            </span>
                        </span>
                        <p class='p-text mt-4 text-center text-3xl font-bold text-gray-800 whitespace-pre-line'>
                            Track your progress
                        </p>
                        <p class='p-text mt-4 text-center px-8'>Track your progress and summary with visual. Keep track of your tasks status and performance of your work</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--
    <section>
        <img src="imgs/in-homepage-banner.jpg" alt="Home Image" class="img-fluid" />
    </section>
        -->

    <section class="py-8">
        <div class="container mx-auto">
            <div class="flex">
                <div class="col-12 text-center mx-auto  ">
                    <center>
                        <h2 class="text-xl">Our Process</h2>
                        <p class="text-3xl"><b>We have a Simple 3 Steps Process</b></p>
                    </center>
                </div>
            </div>

            <div class="flex mt-4">
                <div class="w-1/3 text-center flex flex-col justify-center items-center">
                    <div class="text-center m-2 flex justify-center items-center flex-col w-full">
                        <span class='flex justify-center items-center bg-gradient-to-b rounded-full p-2 h-24 w-24 text-transparent from-violet-800 to-indigo-800 bg-indigo-600'>
                            <span class="material-icons text-white text-4xl">account_circle
                            </span>
                        </span>
                        <p class='p-text mt-4 text-center text-3xl font-bold text-gray-800 whitespace-pre-line'>Sign Up</p>
                        <p class='p-text mt-4 text-center px-8'>Make tasks simpler with task list, steps and reminder to remind you doing tasks.</p>
                    </div>
                </div>
                <div class="w-1/3 text-center flex flex-col justify-center items-center">
                    <div class="text-center m-2 flex justify-center items-center flex-col w-full">
                        <span class='flex justify-center items-center bg-gradient-to-b rounded-full p-2 h-24 w-24 text-transparent from-violet-800 to-indigo-800 bg-indigo-600'>
                            <span class="material-icons text-white text-4xl">local_library
                            </span>
                        </span>
                        <p class='p-text mt-4 text-center text-3xl font-bold text-gray-800 whitespace-pre-line'>Search Books</p>
                        <p class='p-text mt-4 text-center px-8'>Explore rich features todo task list to keep organize. Write down tasks and steps to make it practical</p>
                    </div>
                </div>
                <div class="w-1/3 text-center flex flex-col justify-center items-center">
                    <div class="text-center m-2 flex justify-center items-center flex-col w-full">
                        <span class='flex justify-center items-center bg-gradient-to-b rounded-full p-2 h-24 w-24 text-transparent from-violet-800 to-indigo-800 bg-indigo-600'>
                            <span class="material-icons text-white text-4xl">tour
                            </span>
                        </span>
                        <p class='p-text mt-4 text-center text-3xl font-bold text-gray-800 whitespace-pre-line'>Visit Us</p>
                        <p class='p-text mt-4 text-center px-8'>Track your progress and summary with visual. Keep track of your tasks status and performance of your work</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
