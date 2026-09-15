<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" media-type="text/html" encoding="utf-8" omit-xml-declaration="yes" indent="yes"/>
	
	<xsl:variable name="head">
		<!-- Meta -->
		<!--
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
		<meta charset="utf-8"/>
		-->
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<title>Remake Learning Playbook</title>
		
		<!-- External CSS -->
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-MfvZlkHCEqatNoGiOXveE8FIwMzZg4W85qfrfIFBfYc= sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous"/>
		<link rel="stylesheet" type="text/css" href="http://gameplan.remakelearning.org/css/bootstrap-theme.min.css"/>
		<link rel="stylesheet" type="text/css" href="http://gameplan.remakelearning.org/css/bootstrap-docs.css"/>
		<link rel="stylesheet" type="text/css" href="http://gameplan.remakelearning.org/css/bootstrap-addXL.css"/>
		<link rel="stylesheet" type="text/css" href="http://gameplan.remakelearning.org/css/bootstrap-blockgrid.css"/>

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="http://gameplan.remakelearning.org/js/html5shiv.min.js"></script>
			<script src="http://gameplan.remakelearning.org/js/html5shiv-printshiv.min.js"></script>
			<script src="http://gameplan.remakelearning.org/js/respond.min.js"></script>
		<![endif]-->
		
		<!-- Fonts -->
		<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,400,600,300"/>
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"/>
		
		<!-- Custom CSS -->
		<style type="text/css">
		body {
			font-family: 'Open Sans', sans-serif;
		}
		
		/* Navbar */
		.navbar {
			margin-bottom: 0;
		}
		ul.nav li {
			font-weight: 600;
		}
		.navbar-img a {
			padding: 0;
		}
		@media (max-width:767px) {
			.navbar-collapse {
				margin-top: 9px;
				background-color: #222222;
			}
			.navbar-toggle {
				margin-top: 18px;
			}
		}
		@media (min-width: 768px) {
				.navbar .navbar-nav {
						display: inline-block;
						float: none;
						vertical-align: top;
				}

				.navbar .navbar-collapse {
						text-align: center;
				}
		}
		.nav-tabs .dropdown-menu {
			margin-top: 0;
			border-top: 0;
			border-color: #dddddd;
			border-top-right-radius: 5px;
		}

		/* Utility Classes */
		.no-gutter {
			padding-left: 0!important;
			padding-right: 0!important;
		}
		.no-gutter-left {
			padding-left: 0!important;
		}
		.no-gutter-right {
			padding-right: 0!important;
		}
		.no-border {
			border:0!important;
		}
		.no-shadow {
			-moz-box-shadow: none !important;
			-webkit-box-shadow: none !important;
			box-shadow: none !important;
		}
		@media (max-width:767px) {
			.no-gutter-xs {
				padding-left: 0;
				padding-right: 0;
			}
		}
		@media (max-width:991px) and (min-width:768px) {
			.no-gutter-sm {
				padding-left: 0;
				padding-right: 0;
			}
		}
		@media (max-width:1199px) and (min-width:992px) {
			.no-gutter-md {
				padding-left: 0;
				padding-right: 0;
			}
		}
		@media (max-width:1599px) and (min-width:1200px) {
			.no-gutter-lg {
				padding-left: 0;
				padding-right: 0;
			}
		}
		@media (min-width:1600px) {
			.no-gutter-xl {
				padding-left: 0;
				padding-right: 0;
			}
		}
		
		.toc-heading {
			text-transform: uppercase;
			font-weight: 300;
		}
		p.dropcap:first-letter {
			float: left; 
			font-size: 320%; line-height: 100%; padding-top: 0; padding-right: 6px;
		}
		
		.bs-docs-sidebar {
			padding-left: 0;
		}
		
		.bs-docs-sidebar .nav>.active:focus>a,
		.bs-docs-sidebar .nav>.active:hover>a,
		.bs-docs-sidebar .nav>.active>a {
			font-weight: 600;
			color: #d14e37;
			border-left: 2px solid #d14e37;
		}
		.bs-docs-sidebar .nav>li>a:focus,
		.bs-docs-sidebar .nav>li>a:hover {
			color: #d14e37;
			border-left: 1px solid #d14e37;
		}
		
		.bs-docs-sidebar .nav {
			margin-top: 0;
		}

		/* Shared Page Layout */
		#content {
			padding-bottom: 60px;
		}
		#footer-funders {
			background-color: #d4d4d4;
			padding-top: 20px; 
			padding-bottom: 20px;
		}
		#footer-about-contact {
			background-color: #ededed; 
			padding-top: 40px; 
			padding-bottom: 40px;
		}
		#footer-license {
			padding-top: 5px; 
			padding-bottom: 10px;
		}
		#footer-funders .footer-logo {
			height: 100px;
			margin-right: auto;
			margin-left: auto;
		}
		
		.playbook_case-study_more-info ul.list-group {
			box-shadow: none;
			margin-top: 20px;
		}	
		
		.playbook_case-study_more-info li.list-group-item {
			border: 0;
			padding-left: 0;
			padding-right: 0;
		}
		
		.playbook_case-study_text-author {
			font-style: italic;
			text-align: center;
			display: none;
		}
		
		.playbook_case-studies > article {
			margin-top: 6rem;
		}

		.playbook_case-studies > article > header > p.lead {
			margin-top: 13px;
		}	
		
		@media (min-width:992px) {
				.playbook_action-button-text {
						padding-left: .75rem;
				}
		}				
		@media (min-width:768px) {
				.playbook_cover {
						margin-top: -15px; 
						margin-bottom: -15px; 
						padding-top: 15px; 
						padding-bottom: 15px; 
						background-image: url('http://gameplan.remakelearning.org/images/playbook_cover.thumb.jpg'); 
						background-size: contain; 
						background-repeat: no-repeat; 
						background-position: right center;
				}
		}
		
		.bs-docs-sidenav .toc-extra {
			display: none;
		}
		.bs-docs-sidenav .active .toc-extra {
			display: inline;
		}

		@media (min-width:992px) {
			div[role="main"] {
				margin-bottom: 50rem;
			}
		}
		
		form .anchorjs-link {
			display: none;
		}
			
		
		</style>
		
		<!-- Favicons -->
		<link rel="apple-touch-icon" sizes="57x57" href="http://gameplan.remakelearning.org/images/touch-icons/touch-icon-iphone.png"/>
		<link rel="apple-touch-icon" sizes="76x76" href="http://gameplan.remakelearning.org/images/touch-icons/touch-icon-ipad.png"/>
		<link rel="apple-touch-icon" sizes="120x120" href="http://gameplan.remakelearning.org/images/touch-icons/touch-icon-iphone-retina.png"/>
		<link rel="apple-touch-icon" sizes="152x152" href="http://gameplan.remakelearning.org/images/touch-icons/touch-icon-ipad-retina.png"/>
		<link rel="apple-touch-icon" sizes="180x180" href="http://gameplan.remakelearning.org/images/touch-icons/touch-icon-iphone-6-plus.png"/>
		<link rel="icon" href="http://gameplan.remakelearning.org/favicon.ico"/>
			
	</xsl:variable>
	<xsl:variable name="navbar">
		<!-- Navbar -->
		<header class="navbar navbar-inverse navbar-static-top" id="top" role="banner" style="height: 70px;">
			<div class="container-fluid no-gutter">
				<div class="col-xs-12">
					<div class="container-fluid no-gutter-xs no-gutter-sm">
						<div class="navbar-header">
							<button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							<a class="navbar-brand visible-xs-block" style="padding-top: 12px; padding-right: 40px;" href="http://remakelearning.org/">
								<img style="height: 50px;" src="http://gameplan.remakelearning.org/images/remakelearning.svg" alt="Remake Learning" class="img-responsive"/>
							</a>
						</div>
						<nav class="collapse navbar-collapse bs-navbar-collapse">
							<ul class="nav navbar-nav" style="padding-top: 10px;">
								<li class="navbar-img hidden-xs">
									<a class="navbar-brand hidden-sm" style="margin-top: -10px; margin-right: 20px;" href="http://remakelearning.org/">
										<img style="height: 50px;" src="http://gameplan.remakelearning.org/images/remakelearning.svg" alt="Remake Learning" class="img-responsive"/>
									</a>
									<a class="navbar-brand visible-sm-block" style="margin-top: -10px; margin-right: 10px;" href="http://remakelearning.org/" title="Remake Learning">
										<img style="height: 46px;" src="http://gameplan.remakelearning.org/images/petals.svg" alt="Remake Learning" class="img-responsive"/>
									</a>					
								</li>
								<li>
									<a href="http://remakelearning.org/blog/">Blog</a>
								</li>
								<li>
									<a href="http://remakelearning.org/blog/category/shared/">News</a>
								</li>
								<li>
									<a href="http://remakelearning.org/case-studies/">Case Studies</a>
								</li>
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Calendar <span class="caret"></span></a>
									<ul class="dropdown-menu" role="menu">
										<li><a href="http://remakelearning.org/calendar/educators-innovators/">For Educators &amp; Innovators</a></li>
										<li><a href="http://remakelearning.org/calendar/youth-teens/">For Youth &amp; Teens</a></li>
										<li><a href="http://remakelearning.org/calendar/children-families/">For Children &amp; Families</a></li>
									</ul>
								</li>
								<li class="dropdown active">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Resources &amp; Tools <span class="caret"></span></a>
									<ul class="dropdown-menu" role="menu">
										<li><a href="http://remakelearning.org/resources/schools-teachers/">For Schools &amp; Teachers</a></li>
										<li><a href="http://remakelearning.org/resources/communities-nonprofits/">For Communities &amp; Nonprofits</a></li>
										<li><a href="http://remakelearning.org/resources/children-youth-families/">For Children, Youth, &amp; Families</a></li>
										<li><a href="http://remakelearning.org/resources/tweens-teens/">For Tweens &amp; Teens</a></li>
										<li><a href="http://remakelearning.org/resources/makers-tinkerers/">For Makers, Artists, &amp; Tinkerers</a></li>
										<li><a href="http://remakelearning.org/resources/designers-developers-technologists/">For Designers, Developers &amp; Technologists</a></li>
										<li class="divider"></li>
										<li><a href="http://remakelearning.org/competencies/">Learning Competencies for Digital Badges</a></li>
										<li><a href="http://remakelearning.org/tools/">Digital Learning Tools</a></li>
										<li><a href="http://remakelearning.org/resources/library/">Resource Library</a></li>
										<li class="divider"></li>
										<li class="active"><a href="http://remakelearning.org/playbook/">Network Playbook</a></li>
										<li><a href="http://gameplanner.remakelearning.org/" target="_blank">Gameplan Web App</a></li>
									</ul>
								</li>
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Network <span class="caret"></span></a>
									<ul class="dropdown-menu" role="menu">
										<li><a href="http://remakelearning.org/focus-areas/">Focus Areas</a></li>
										<li><a href="http://remakelearning.org/key-initiatives/">Key Initiatives</a></li>
										<li><a href="http://remakelearning.org/affinity-groups/">Affinity &amp; Interest Groups</a></li>
										<li><a href="http://remakelearning.org/network/meet-ups/">Network Meet-Ups</a></li>
										<li><a href="http://remakelearning.org/projects/">Projects</a></li>
										<li><a href="http://remakelearning.org/people/">People</a></li>
										<li><a href="http://remakelearning.org/organizations/">Organizations</a></li>
										<li><a href="http://remakelearning.org/network/national-partners/">National Partners</a></li>
									</ul>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</header>
	</xsl:variable>
	<xsl:variable name="share_chapters">
		<section id="share-addtoany" class="container-fluid no-gutter">
			<!-- AddToAny BEGIN -->
			<div class="visible-xs-block a2a_kit a2a_kit_size_32 a2a_floating_style a2a_vertical_style" data-a2a-url="http://remakelearning.org/playbook/" data-a2a-title="Remake Learning Playbook" style="right:0px; bottom:0px;">
				<a class="a2a_dd" href="https://www.addtoany.com/share" title="Share"></a>
			</div>
			<div class="hidden-xs a2a_kit a2a_kit_size_32 a2a_floating_style a2a_vertical_style" data-a2a-url="http://remakelearning.org/playbook/" data-a2a-title="Remake Learning Playbook" style="right:0px; bottom:0px;">
				<a class="a2a_button_twitter  hidden-sm hidden-md"></a>
				<a class="a2a_button_linkedin hidden-sm hidden-md"></a>
				<a class="a2a_button_facebook hidden-sm hidden-md"></a>
				<a class="a2a_button_email    hidden-sm hidden-md"></a>
				<a class="a2a_dd" href="https://www.addtoany.com/share" title="Share"></a>
			</div>
			<script type="text/javascript" src="http://static.addtoany.com/menu/page.js"></script>
			<!-- AddToAny END -->
		</section>
	</xsl:variable>
	<xsl:variable name="share_case-studies">
		<section id="share-addtoany" class="container-fluid no-gutter">
			<!-- AddToAny BEGIN -->
			<div class="visible-xs-block a2a_kit a2a_kit_size_32 a2a_floating_style a2a_vertical_style" data-a2a-url="http://remakelearning.org/playbook/case-studies/" data-a2a-title="Remake Learning Playbook Case Studies" style="right:0px; bottom:0px;">
				<a class="a2a_dd" href="https://www.addtoany.com/share" title="Share"></a>
			</div>
			<div class="hidden-xs a2a_kit a2a_kit_size_32 a2a_floating_style a2a_vertical_style" data-a2a-url="http://remakelearning.org/playbook/playbook/case-studies/" data-a2a-title="Remake Learning Playbook Case Studies" style="right:0px; bottom:0px;">
				<a class="a2a_button_twitter  hidden-sm hidden-md"></a>
				<a class="a2a_button_linkedin hidden-sm hidden-md"></a>
				<a class="a2a_button_facebook hidden-sm hidden-md"></a>
				<a class="a2a_button_email    hidden-sm hidden-md"></a>
				<a class="a2a_dd" href="https://www.addtoany.com/share" title="Share"></a>
			</div>
			<script type="text/javascript" src="http://static.addtoany.com/menu/page.js"></script>
			<!-- AddToAny END -->
		</section>
	</xsl:variable>
	<xsl:variable name="share_plays-in-detail">
		<section id="share-addtoany" class="container-fluid no-gutter">
			<!-- AddToAny BEGIN -->
			<div class="visible-xs-block a2a_kit a2a_kit_size_32 a2a_floating_style a2a_vertical_style" data-a2a-url="http://remakelearning.org/playbook/plays-in-detail/" data-a2a-title="Remake Learning Playbook Plays in Detail" style="right:0px; bottom:0px;">
				<a class="a2a_dd" href="https://www.addtoany.com/share" title="Share"></a>
			</div>
			<div class="hidden-xs a2a_kit a2a_kit_size_32 a2a_floating_style a2a_vertical_style" data-a2a-url="http://remakelearning.org/playbook/plays-in-detail/" data-a2a-title="Remake Learning Playbook Plays in Detail" style="right:0px; bottom:0px;">
				<a class="a2a_button_twitter  hidden-sm hidden-md"></a>
				<a class="a2a_button_linkedin hidden-sm hidden-md"></a>
				<a class="a2a_button_facebook hidden-sm hidden-md"></a>
				<a class="a2a_button_email    hidden-sm hidden-md"></a>
				<a class="a2a_dd" href="https://www.addtoany.com/share" title="Share"></a>
			</div>
			<script type="text/javascript" src="http://static.addtoany.com/menu/page.js"></script>
			<!-- AddToAny END -->
		</section>
	</xsl:variable>
	<xsl:variable name="masthead">
		<!-- Masthead -->
		<section id="masthead" class="container-fluid bs-docs-header no-gutter" tabindex="-1" style="background-color: rgb(209,78,55); background-image: linear-gradient(rgb(209,78,55) 0px, rgb(184,68,48) 100%);">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-10 col-lg-offset-1 col-xl-8 col-xl-offset-2">
				<div class="row playbook_cover">
					<div class="col-xs-12 col-sm-9 col-md-9 col-lg-10">
						<h1 style="margin-right: 0;">Remake Learning<br/>Playbook</h1>
						<p style="color: white; margin-right: 0;">A field guide of ideas and resources for building innovation <br class="hidden-xs hidden-sm"/>networks for teaching and learning created by The Sprout Fund</p>
						<div class="btn-group" role="group" style="margin-top: 2rem;">
							<div class="btn-group">
								<button class="btn btn-default dropdown-toggle" data-toggle="dropdown" type="button"><i class="fa fa-download hidden-xs hidden-sm"></i><span class="playbook_action-button-text"><span class="visible-xs-inline">Playbook</span><span class="hidden-xs"><span class="hidden-sm">Free</span> Downloads</span></span><span class="caret" style="margin-left: .25rem;"></span></button>
								<ul class="dropdown-menu" role="menu">
									<li class="visible-xs-block">
										<a href="#order-form">Order Print Edition</a>
									</li>
									<li class="visible-xs-block">
										<a href="http://www.amazon.com/gp/product/B0176NQYTY" target="_blank">Order Kindle Edition</a>
									</li>
									<li class="divider visible-xs-block" role="separator"></li>
									<li>
										<a href="http://downloads.sproutfund.org/playbook/remake-learning-playbook-20151022.pdf" target="_blank"><i class="fa fa-fw fa-file-pdf-o hidden-xs hidden-sm"></i><span class="playbook_action-button-text"><span class="visible-xs-inline">Download</span> PDF <span class="hidden-xs">(5.8 <abbr class="initialism" title="megabytes">MB</abbr>)</span></span></a>
									</li>
									<li>
										<a href="http://downloads.sproutfund.org/playbook/remake-learning-playbook-20151026.epub" target="_blank"><i class="fa fa-fw fa-book hidden-xs hidden-sm"></i><span class="playbook_action-button-text"><span class="visible-xs-inline">Download</span> iBooks ePub <span class="hidden-xs">(487 <abbr class="initialism" title="kilobytes">KB</abbr>)</span></span></a>
									</li>
									<li>
										<a href="http://downloads.sproutfund.org/playbook/remake-learning-playbook-20151026.mobi" target="_blank"><i class="fa fa-fw fa-book hidden-xs hidden-sm"></i><span class="playbook_action-button-text"><span class="visible-xs-inline">Download</span> Kindle mobi <span class="hidden-xs">(544 <abbr class="initialism" title="kilobytes">KB</abbr>)</span></span></a>
									</li>
									<li class="divider" role="separator"></li>
									<li>
										<a href="http://downloads.sproutfund.org/playbook/advocacy-kit_generic.zip" target="_blank"><i class="fa fa-fw fa-file-image-o hidden-xs hidden-sm"></i><span class="playbook_action-button-text"><span class="visible-xs-inline">Download</span> Advocacy Kit <span class="hidden-xs">(zipped, 6.3 <abbr class="initialism" title="megabytes">MB</abbr>)</span></span></a>
									</li>
								</ul>
							</div><div class="btn-group hidden-xs">
								<button class="btn btn-default dropdown-toggle" data-toggle="dropdown" type="button"><i class="fa fa-shopping-cart hidden-xs hidden-sm"></i><span class="playbook_action-button-text">Order Copy</span><span class="caret" style="margin-left: .25rem;"></span></button>
								<ul class="dropdown-menu" role="menu">
									<li>
										<a href="#order-form"><i class="fa fa-fw fa-book hidden-xs hidden-sm"></i><span class="playbook_action-button-text">Print Edition</span></a>
									</li>
									<li>
										<a href="http://www.amazon.com/gp/product/B0176NQYTY" target="_blank"><i class="fa fa-fw fa-amazon hidden-xs hidden-sm"></i><span class="playbook_action-button-text">Kindle Edition</span></a>
									</li>
								</ul>
							</div><a class="btn btn-default" href="http://gameplan.remakelearning.org" role="button" target="_blank" type="button"><img class="hidden-xs hidden-sm" src="http://gameplan.remakelearning.org/images/gameplan_button-icon.svg" style="height: 15px; margin-top:-3px;"/><span class="playbook_action-button-text"><span class="hidden-xs">Create</span> Gameplan</span></a><button class="btn btn-default" data-target="#subscribe-modal" data-toggle="modal" type="button"><i class="fa fa-envelope hidden-xs hidden-sm"></i><span class="playbook_action-button-text"><span class="hidden-xs">Subscribe to</span> Updates</span></button>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Subscribe Modal -->
		<div id="subscribe-modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="Subscribe">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times"></i></span></button>
						<h4 class="modal-title" id="Subscribe">Subscribe to Remake Learning Updates</h4>
					</div>
					<div class="modal-body">
						<p>Join the Remake Learning email distribution list!</p>
						<!-- Customized MailChimp Signup Form -->
						<form action="http://remakelearning.us4.list-manage.com/subscribe/post?u=d88590060b35162f56ec6156c&amp;id=bdb42114c1" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate="true">
							<div class="form-group">
								<label for="mce-EMAIL" class="sr-only sr-only-focusable">Email Address<span class="text-danger">*</span></label>
								<input type="email" class="form-control" name="EMAIL" id="mce-EMAIL" placeholder="Email Address (required)" required="true"/>
							</div>
							<div class="row">
								<div class="col-xs-12 col-sm-6">
									<div class="form-group">
										<label for="mce-FNAME" class="sr-only sr-only-focusable">First Name</label>
										<input type="text" class="form-control" name="FNAME" id="mce-FNAME" placeholder="First Name"/>
									</div>
								</div>
								<div class="col-xs-12 col-sm-6">
									<div class="form-group">
										<label for="mce-LNAME" class="sr-only sr-only-focusable">Last Name</label>
										<input type="text" class="form-control" name="LNAME" id="mce-LNAME" placeholder="Last Name"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12 col-sm-6">
									<div class="form-group">
										<label for="mce-ORG" class="sr-only sr-only-focusable">Organization/Affiliation</label>
										<input type="text" class="form-control" name="ORG" id="mce-ORG" placeholder="Organization/Affiliation"/>
									</div>
								</div>
								<div class="col-xs-12 col-sm-6">
									<div class="form-group">
										<label for="mce-MMERGE9" class="sr-only sr-only-focusable">Region/Location/Hometown</label>
										<input type="text" class="form-control" name="MMERGE9" id="mce-MMERGE9" placeholder="Region/Location/Hometown"/>
									</div>
								</div>
							</div>
							<div id="mce-responses" class="clearfix">
								<div class="response" id="mce-error-response" style="display:none"></div>
								<div class="response" id="mce-success-response" style="display:none"></div>
							</div>
							<!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
							<div style="position: absolute; left: -5000px;">
								<input type="text" name="b_d88590060b35162f56ec6156c_bdb42114c1" tabindex="-1" value=""/>
								<input type="checkbox" value="2048" name="group[14769][2048]" id="mce-group[14769]-14769-7" checked="checked" style="display: none;"/>
							</div>
							<div class="clearfix">
								<input type="submit" class="btn btn-default" value="Subscribe" name="subscribe" id="mc-embedded-subscribe"/>
							</div>
						</form>
						<script type="text/javascript" src="http://downloads.mailchimp.com/js/mc-validate.js"></script>
						<script type="text/javascript">(function($) {window.fnames = new Array(); window.ftypes = new Array(); fnames[0]='EMAIL'; ftypes[0]='email'; fnames[1]='FNAME'; ftypes[1]='text'; fnames[2]='LNAME'; ftypes[2]='text'; fnames[3]='ORG'; ftypes[3]='text'; fnames[4]='MMERGE9'; ftypes[4]='text';}(jQuery));var $mcj = jQuery.noConflict(true);</script>
					</div>
				</div>
			</div>
		</div>
	</xsl:variable>	
	<xsl:variable name="about-text">
		<article class="bs-docs-section playbook_chapter clearfix" id="about">
			<p class="lead">The Remake Learning Playbook is an ambitious project to open source the project code for learning innovation ecosystems.</p>
			<p>Created by <a href="http://www.sproutfund.org" target="_blank">The Sprout Fund</a> as a digital &amp; tangible product, the Playbook documents the process and outcomes of both the Pittsburgh region’s efforts to create a community-wide learning innovation network, and specific projects the network has catalyzed.</p>
			<p>The Playbook captures the spirit and substance of the <a href="http://remakelearning.org/network" target="_blank">Remake Learning Network</a> in action. It covers the theory and practice of building learning innovation networks, the resources and strategies required to put networks into action, and the impact of the network in schools, museums, libraries, communities, and more.</p>
		</article>
	</xsl:variable>
	<xsl:variable name="about-updates">
		<article class="bs-docs-section playbook_chapter clearfix">
			<div class="row">
				<div class="col-xs-12 col-sm-6">
					<h3 id="playbook-web-events"><i class="fa fa-desktop text-muted"></i> Web Events on Crowdcast.io</h3>
					<ul class="fa-ul">
						<li>
							<i class="fa-li fa fa-caret-right"></i><a href="https://www.crowdcast.io/e/rlplaybook01" target="_blank"><strong>Mon Nov 2 @ 4pm EST</strong></a>: Guided walkthrough of the Remake Learning Playbook with Ryan Coon &amp; Matt Hannigan
						</li>
						<li>
							<i class="fa-li fa fa-caret-right"></i><a href="https://www.crowdcast.io/e/rlplaybook02" target="_blank"><strong>Wed Dec 2 @ 1pm EST</strong></a>: Guided walkthrough of the Remake Learning Playbook with Ryan Coon &amp; Matt Hannigan
						</li>
					</ul>
				</div>
				<div class="col-xs-12 col-sm-6">
					<h3 id="playbook-conferences-presentations"><i class="fa fa-comments text-muted"></i> Conferences &amp; Presentations</h3>
					<ul class="fa-ul">
						<li>
							<i class="fa-li fa fa-caret-right"></i><strong>Wed Nov 4 @ 11:10am EST</strong>: <a href="https://tretc2015.sched.org/event/7ce027c91e489bc28a83b3c3da5a2b86" target="_blank">TRETC 2015</a> at Bethel Park High School in Bethel Park, PA
						</li>
						<li>
							<i class="fa-li fa fa-caret-right"></i><strong>Nov 5-7</strong>: <a href="https://2015.mozillafestival.org/" target="_blank">Mozilla Festival 2015</a> in London, UK
						</li>
						<li>
							<i class="fa-li fa fa-caret-right"></i><strong>Nov 18-22</strong>: <a href="http://www.naeyc.org/conference/" target="_blank">NAEYC Annual Conference &amp; Expo</a> in Orlando, FL
						</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<h3 id="playbook-in-the-news"><i class="fa fa-newspaper-o text-muted"></i> Playbook In the News (<a href="https://twitter.com/search?q=%23rlplaybook" target="_blank">#RLplaybook</a>)</h3>
					<ul class="fa-ul">
						<li>
							<i class="fa-li fa fa-caret-right"></i><a href="http://www.kidsburgh.org/features/remake-learning-playbook-network-of-educators-share-best-practices" target="_blank"><strong>Kidsburgh</strong></a>: &ldquo;A new report from Remake Learning provides a how-to guide for replicating some of the success stories of western Pennsylvania school districts leading the way in education technology.&rdquo; (10/30/2015)
						</li>
						<li>
							<i class="fa-li fa fa-caret-right"></i><a href="http://hechingerreport.org/to-the-future-and-beyond-a-new-class-of-innovative-schools-joins-a-growing-network-of-educators-who-share-best-practices/" target="_blank"><strong>The Hechinger Report</strong></a>: &ldquo;What will the future of education bring? It&rsquo;s hard to say. That story is still being written by teachers, students, principals and parents. But we can get a glimpse by studying the high achievers, to learn how they are innovating.&rdquo; (10/28/2015)
						</li>
						<li>
							<i class="fa-li fa fa-caret-right"></i><a href="http://triblive.com/news/allegheny/9313773-74/network-playbook-pittsburgh" target="_blank"><strong>Pittsburgh Tribune-Review</strong></a>: &ldquo;A Pittsburgh-area network of educators and entrepreneurs has literally written the playbook on how to make teaching practices more innovative through community collaboration, and more than 50 district leaders from across the country will be taking it home this week.&rdquo; (10/25/2015)
						</li>
						<li>
							<i class="fa-li fa fa-caret-right"></i><a href="http://nextgenlearning.org/blog/7-roles-next-gen-learning-ecosystem" target="_blank"><strong>Next Generation Learning Challenges</strong></a>: &ldquo;Local collaborative learning networks, incubating hubs, and education ecosystems are built on partnerships. These networks attract educators, entrepreneurs, funders, and community leaders.&rdquo; (9/9/2015)
						</li>
						<li>
							<i class="fa-li fa fa-caret-right"></i><a href="http://www.hfrp.org/publications-resources/browse-our-publications/family-involvement-news-september-2015" target="_blank"><strong>Harvard Family Research Project</strong></a>: &ldquo;A must-read for those looking for ideas and resources for remaking learning in their community! The Remake Learning Network has created a guide that focuses on the structure, strategies, and learned advice of network members.&rdquo; (9/1/2015)
						</li>
						<li>
							<i class="fa-li fa fa-caret-right"></i><a href="https://www.whitehouse.gov/blog/2015/07/08/inspiring-makers-pittsburgh" target="_blank"><strong>White House Blog</strong></a>: &ldquo;One of the organizations that has responded to the President&rsquo;s call to action is the Remake Learning Network. Thanks to the work of the Network and its members, young people in the region have the opportunity to make their own films, learn to code, build robots, and become &lsquo;citizen scientists.&rsquo;&rdquo; (7/8/2015)
						</li>
						<li>
							<i class="fa-li fa fa-caret-right"></i><a href="http://www.nextpittsburgh.com/business-tech-news/pittsburgh-rocked-national-week-of-making-heres-why/" target="_blank"><strong>Next Pittsburgh</strong></a>: &ldquo;The Remake Learning Playbook is a living document designed as a guide for ideas and resources to help accelerate the learning opportunities available for all children.&rdquo; (6/22/2015)
						</li>
						<li>
							<i class="fa-li fa fa-caret-right"></i><a href="http://blogs.edweek.org/edweek/DigitalEducation/2015/06/pittsburgh_digital-learning_playbook.html" target="_blank"><strong>Education Week</strong></a>: &ldquo;Hoping to help other cities replicate their nationally recognized network of hands-on and digital-learning supporters, civic and education leaders in Pittsburgh have released a new &lsquo;playbook&rsquo; replete with strategies, stories, and lessons learned.&rdquo; (6/17/2015)
						</li>
						<li>
							<i class="fa-li fa fa-caret-right"></i><a href="http://www.post-gazette.com/news/education/2015/06/12/Innovative-Pittsburgh-programs-to-be-introduced-on-a-national-level-today/stories/201506120149" target="_blank"><strong>Pittsburgh Post-Gazette</strong></a>: &ldquo;The Sprout Fund, a local nonprofit that supports innovative ideas and grassroots community projects, wants cities and regions across the country to be able to learn from these and other local ideas.&rdquo; (6/12/2015)
						</li>
					</ul>
				</div>
			</div>
		</article>
	</xsl:variable>
	<xsl:variable name="toc-print_chapters">
		<p id="toc-print-welcome-letter" class="toc-print">
			<a href="playbook.html#welcome-letter"><span class="toc-heading">Welcome Letter</span><em> from Pittsburgh Mayor William Peduto &amp; Bill Strickland</em></a>
		</p>
		<p id="toc-print-chapter-1-introduction" class="toc-print">
			<a href="playbook.html#chapter-1-introduction"><span class="toc-heading">Chapter 1</span> : Introduction <em>by Gregg Behr &amp; Dr. Lynne Schrum</em></a>
		</p>
		<p id="toc-print-chapter-2-remaking-learing-for-a-changing-world" class="toc-print">
			<a href="playbook.html#chapter-2-remaking-learing-for-a-changing-world"><span class="toc-heading">Chapter 2</span> : Remaking Learning for a Changing World</a>
		</p>
		<p id="toc-print-note-taking-advantage-of-connected-learning-opportunities" class="toc-print">
			<a href="playbook.html#note-taking-advantage-of-connected-learning-opportunities"><span class="toc-heading">Note</span> : Taking Advantage of Connected Learning Opportunities <em>by Mimi Ito</em></a>
		</p>
		<p id="toc-print-chapter-3-the-learning-network" class="toc-print">
			<a href="playbook.html#chapter-3-the-learning-network"><span class="toc-heading">Chapter 3</span> : The Learning Network</a>
			<ul class="fa-ul">
				<li>
					<i class="fa-li fa fa-caret-right"></i><a href="playbook.html#learning-environments">Learning Environments</a>
				</li>
				<li>
					<i class="fa-li fa fa-caret-right"></i><a href="playbook.html#innovation-research-development">Innovation Research &amp; Development</a>
				</li>
				<li>
					<i class="fa-li fa fa-caret-right"></i><a href="playbook.html#learning-scholarship-advocacy">Learning Scholarship &amp; Advocacy</a>
				</li>
				<li>
					<i class="fa-li fa fa-caret-right"></i><a href="playbook.html#commercial-entrepreneurial-engagement">Commercial &amp; Entreprenurial Engagement</a>
				</li>
				<li>
					<i class="fa-li fa fa-caret-right"></i><a href="playbook.html#strategic-stewardship">Strategic Stewardship</a>
				</li>
				<li>
					<i class="fa-li fa fa-caret-right"></i><a href="playbook.html#regional-strengths-priorities">Regional Strengths and Priorities</a>
				</li>
			</ul>
		</p>
		<p id="toc-print-essay-how-networks-can-transform-learning" class="toc-print">
			<a href="playbook.html#essay-how-networks-can-transform-learning"><span class="toc-heading">Essay</span> : How Networks Can Transform Learning <em>by Mark Surman</em></a>
		</p>
		<p id="toc-print-chapter-4-network-support-strategies" class="toc-print">
			<a href="playbook.html#chapter-4-network-support-strategies"><span class="toc-heading">Chapter 4</span> : Network Support Strategies</a>
			<ul class="fa-ul">
				<li>
					<i class="fa-li fa fa-caret-right"></i> <a href="playbook.html#convene">Convene</a>
				</li>
				<li>
					<i class="fa-li fa fa-caret-right"></i> <a href="playbook.html#catalyze">Catalyze</a>
				</li>
				<li>
					<i class="fa-li fa fa-caret-right"></i> <a href="playbook.html#communicate">Communicate</a>
				</li>
				<li>
					<i class="fa-li fa fa-caret-right"></i> <a href="playbook.html#coordinate">Coordinate</a>
				</li>
				<li>
					<i class="fa-li fa fa-caret-right"></i> <a href="playbook.html#champion">Champion</a>
				</li>
			</ul>
		</p>
		<p id="toc-print-chapter-5-lessons-learned" class="toc-print">
			<a href="playbook.html#chapter-5-lessons-learned"><span class="toc-heading">Chapter 5</span> : Lessons Learned</a>
		</p>
		<p id="toc-print-chapter-6-the-road-ahead" class="toc-print">
			<a href="playbook.html#chapter-6-the-road-ahead"><span class="toc-heading">Chapter 6</span> : The Road Ahead</a>
		</p>
	</xsl:variable>
	<xsl:variable name="toc_chapters">
		<nav class="bs-docs-sidebar hidden-print">
			<ul class="nav bs-docs-sidenav">
				<li>
					<a href="#about"><span class="toc-heading" style="font-weight: 600;">About the Playbook</span></a>
					<ul class="nav">
						<li><a href="#playbook-web-events">Web Events</a></li>
						<li><a href="#playbook-conferences-presentations">Conferences &amp; Presentations</a></li>
						<li><a href="#playbook-in-the-news">In the News</a></li>
					</ul>
				</li>
				<li style="padding-top: 14px;">
					<a href="#"><span class="toc-heading" style="font-weight: 600;">Playbook Chapters</span></a>
					<ul class="nav">
						<li><a href="#welcome-letter">Welcome Letter<br/><em>from Pittsburgh Mayor William Peduto &amp; Bill Strickland</em></a></li>
					</ul>
				</li>
				<li>
					<a href="#chapter-1-introduction"><span class="toc-heading">Chapter 1</span><br/>Introduction<span class="toc-extra"><br/><em>by Gregg Behr &amp; Dr. Lynne Schrum</em></span></a>
				</li>
				<li>
					<a href="#chapter-2-remaking-learing-for-a-changing-world"><span class="toc-heading">Chapter 2</span><br/>Remaking Learning for a Changing World</a>
				</li>
				<li>
					<a href="#note-taking-advantage-of-connected-learning-opportunities"><span class="toc-heading">Note</span><br/>Taking Advantage of Connected Learning Opportunities<span class="toc-extra"><br/><em>by Mimi Ito</em></span></a>
				</li>
				<li>
					<a href="#chapter-3-the-learning-network"><span class="toc-heading">Chapter 3</span><br/>The Learning Network</a>
					<ul class="nav">
						<li><a href="#learning-environments">Learning Environments</a></li>
						<li><a href="#innovation-research-development">Innovation Research &amp; Development</a></li>
						<li><a href="#learning-scholarship-advocacy">Learning Scholarship &amp; Advocacy</a></li>
						<li><a href="#commercial-entrepreneurial-engagement">Commercial &amp; Entreprenurial Engagement</a></li>
						<li><a href="#strategic-stewardship">Strategic Stewardship</a></li>
						<li><a href="#regional-strengths-priorities">Regional Strengths and Priorities</a></li>
					</ul>
				</li>
				<li>
					<a href="#essay-how-networks-can-transform-learning"><span class="toc-heading">Essay</span><br/>How Networks Can Transform Learning<span class="toc-extra"><br/><em>by Mark Surman</em></span></a>
				</li>
				<li>
					<a href="#chapter-4-network-support-strategies"><span class="toc-heading">Chapter 4</span><br/>Network Support Strategies</a>
					<ul class="nav">
						<li><a href="#convene">Convene</a></li>
						<li><a href="#catalyze">Catalyze</a></li>
						<li><a href="#communicate">Communicate</a></li>
						<li><a href="#coordinate">Coordinate</a></li>
						<li><a href="#champion">Champion</a></li>
					</ul>
				</li>
				<li>
					<a href="#chapter-5-lessons-learned"><span class="toc-heading">Chapter 5</span><br/>Lessons Learned</a>
				</li>
				<li>
					<a href="#chapter-6-the-road-ahead"><span class="toc-heading">Chapter 6</span><br/>The Road Ahead</a>
				</li>
				<li style="padding-top: 14px;" class="">
					<a href="case-studies.html#case-studies"><span class="toc-heading" style="font-weight: 600;">Case Studies</span></a>
				</li>
				<li>
					<a href="plays-in-detail.html#plays-in-detail"><span class="toc-heading" style="font-weight: 600;">Plays in Detail</span></a>
				</li>
				<li>
					<a href="#additional-resources"><span class="toc-heading" style="font-weight: 600;">Additional Resources</span></a>
					<ul class="nav">
						<li><a href="#advocacy-kit">Advocacy Kit</a></li>
						<li><a href="#gameplan-web-app">Gameplan Web App</a></li>
						<li><a href="#voices-of-the-network">Voices of the Network</a></li>
						<li><a href="#more-networks-related-links">More Networks &amp; Related Links</a></li>
					</ul>
				</li>
				<li style="padding-top: 14px;">
					<a href="#acknowledgements">Acknowledgements</a>
					<ul class="nav">
						<li><a href="#acknowledgements-case-study-subjects">Case Study Subjects</a></li>
						<li><a href="#acknowledgements-contributors">Contributors</a></li>
						<li><a href="#acknowledgements-sprout-staff">Sprout Staff</a></li>
						<li><a href="#acknowledgements-financial-support">Financial Support</a></li>
						<li><a href="#acknowledgements-about-the-sprout-fund">About The Sprout Fund</a></li>
						<li><a href="#acknowledgements-about-remake-learning">About Remake Learning</a></li>
					</ul>
				</li>
				<li><a href="#order-form">Order Free Copy</a></li>
				<li><a href="#license">License</a></li>							
				<li><a href="#contact-us-about-the-playbook">Contact</a></li>							
			</ul>
			<a class="back-to-top" href="#top">
				Back to top
			</a>
		</nav>		
	</xsl:variable>
	<xsl:variable name="toc_case-studies">
		<nav class="bs-docs-sidebar hidden-print">
			<ul class="nav bs-docs-sidenav">
				<li>
					<a href="#about"><span class="toc-heading" style="font-weight: 600;">About the Playbook</span></a>
				</li>
				<li>
					<a href="playbook.html#chapters"><span class="toc-heading" style="font-weight: 600;">Playbook Chapters</span></a>
				</li>
				<li style="padding-top: 14px;" class="">
					<a href="#case-studies"><span class="toc-heading" style="font-weight: 600;">Case Studies</span></a>
				</li>
				<li>
					<a href="#assemble">Assemble</a>
					<ul class="nav">
						<li><a href="#assemble-by-the-numbers">By the Numbers</a></li>
						<li><a href="#assemble-network-in-action">Network in Action</a></li>
						<li><a href="#assemble-person-of-interest">Persons of Interest</a></li>
						<li><a href="#assemble-more-info">More Info, Downloads,<br/>Resources &amp; Partners</a></li>
					</ul>
				</li>
				<li>
					<a href="#birdbrain-technologies">BirdBrain Technologies</a>
					<ul class="nav">
						<li><a href="#birdbrain-technologies-by-the-numbers">By the Numbers</a></li>
						<li><a href="#birdbrain-technologies-network-in-action">Network in Action</a></li>
						<li><a href="#birdbrain-technologies-person-of-interest">Person of Interest</a></li>
						<li><a href="#birdbrain-technologies-more-info">More Info, Downloads,<br/>Resources &amp; Partners</a></li>
					</ul>
				</li>
				<li>
					<a href="#carnegie-mellon-university">Carnegie Mellon University</a>
					<ul class="nav">
						<li><a href="#carnegie-mellon-university-by-the-numbers">By the Numbers</a></li>
						<li><a href="#carnegie-mellon-university-network-in-action">Network in Action</a></li>
						<li><a href="#carnegie-mellon-university-person-of-interest">Persons of Interest</a></li>
						<li><a href="#carnegie-mellon-university-more-info">More Information</a></li>
					</ul>
				</li>
				<li>
					<a href="#childrens-innovation-project">The Children’s Innovation Project</a>
					<ul class="nav">
						<li><a href="#childrens-innovation-project-by-the-numbers">By the Numbers</a></li>
						<li><a href="#childrens-innovation-project-network-in-action">Network in Action</a></li>
						<li><a href="#childrens-innovation-project-person-of-interest">Persons of Interest</a></li>
						<li><a href="#childrens-innovation-project-more-info">More Info, Downloads,<br/>Resources &amp; Partners</a></li>
					</ul>
				</li>
				<li>
					<a href="#city-of-learning">City of Learning</a>
					<ul class="nav">
						<li><a href="#city-of-learning-by-the-numbers">By the Numbers</a></li>
						<li><a href="#city-of-learning-network-in-action">Network in Action</a></li>
						<!--<li><a href="#city-of-learning-person-of-interest">Person of Interest</a></li>-->
						<li><a href="#city-of-learning-more-info">More Info, Downloads,<br/>Resources &amp; Partners</a></li>
					</ul>
				</li>
				<li>
					<a href="#digital-corps">The Digital Corps</a>
					<ul class="nav">
						<li><a href="#digital-corps-by-the-numbers">By the Numbers</a></li>
						<li><a href="#digital-corps-network-in-action">Network in Action</a></li>
						<li><a href="#digital-corps-person-of-interest">Persons of Interest</a></li>
						<li><a href="#digital-corps-more-info">More Info, Downloads,<br/>Resources &amp; Partners</a></li>
					</ul>
				</li>
				<li>
					<a href="#elizabeth-forward-school-district">Elizabeth Forward School District</a>
					<ul class="nav">
						<li><a href="#elizabeth-forward-school-district-by-the-numbers">By the Numbers</a></li>
						<li><a href="#elizabeth-forward-school-district-network-in-action">Network in Action</a></li>
						<li><a href="#elizabeth-forward-school-district-person-of-interest">Persons of Interest</a></li>
						<li><a href="#elizabeth-forward-more-info">More Information</a></li>
					</ul>
				</li>
				<li>
					<a href="#labs-at-clp">The Labs @ CLP</a>
					<ul class="nav">
						<li><a href="#labs-at-clp-by-the-numbers">By the Numbers</a></li>
						<li><a href="#labs-at-clp-network-in-action">Network in Action</a></li>
						<li><a href="#labs-at-clp-person-of-interest">Person of Interest</a></li>
						<li><a href="#labs-at-clp-more-info">More Info, Downloads,<br/>Resources &amp; Partners</a></li>
					</ul>
				</li>
				<li>
					<a href="#maker-party">Maker Parties</a>
					<ul class="nav">
						<li><a href="#maker-party-by-the-numbers">By the Numbers</a></li>
						<li><a href="#maker-party-network-in-action">Network in Action</a></li>
						<!--<li><a href="#maker-party-person-of-interest">Person of Interest</a></li>-->
						<li><a href="#maker-party-more-info">More Information</a></li>
					</ul>
				</li>
				<li>
					<a href="#makeshop">MAKESHOP at<br/>The Children’s Museum<span class="toc-extra"><br/>of Pittsburgh</span></a>
					<ul class="nav">
						<li><a href="#makeshop-by-the-numbers">By the Numbers</a></li>
						<li><a href="#makeshop-network-in-action">Network in Action</a></li>
						<li><a href="#makeshop-person-of-interest">Persons of Interest</a></li>
						<li><a href="#makeshop-more-info">More Info, Downloads,<br/>Resources &amp; Partners</a></li>
					</ul>
				</li>
				<li>
					<a href="#transformed">transformED at AIU</a>
					<ul class="nav">
						<li><a href="#transformed-by-the-numbers">By the Numbers</a></li>
						<li><a href="#transformed-network-in-action">Network in Action</a></li>
						<li><a href="#transformed-person-of-interest">Persons of Interest</a></li>
						<li><a href="#transformed-more-info">More Info, Downloads,<br/>Resources &amp; Partners</a></li>
					</ul>
				</li>
				<li style="padding-top: 14px;">
					<a href="plays-in-detail.html#plays-in-detail"><span class="toc-heading" style="font-weight: 600;">Plays in Detail</span></a>
				</li>
				<li>
					<a href="playbook.html#additional-resources"><span class="toc-heading" style="font-weight: 600;">Additional Resources</span></a>
				</li>
				<li style="padding-top: 14px;">
					<a href="playbook.html#acknowledgements">Acknowledgements</a>
				</li>
				<li><a href="#order-form">Order Free Copy</a></li>
				<li><a href="#license">License</a></li>							
				<li><a href="#contact-us-about-the-playbook">Contact</a></li>							
			</ul>
			<a class="back-to-top" href="#top">
				Back to top
			</a>
		</nav>		
	</xsl:variable>
	<xsl:variable name="toc_plays-in-detail">
		<nav class="bs-docs-sidebar hidden-print">
			<ul class="nav bs-docs-sidenav">
				<li>
					<a href="#about"><span class="toc-heading" style="font-weight: 600;">About the Playbook</span></a>
				</li>
				<li>
					<a href="playbook.html#chapters"><span class="toc-heading" style="font-weight: 600;">Playbook Chapters</span></a>
				</li>
				<li>
					<a href="case-studies.html#case-studies"><span class="toc-heading" style="font-weight: 600;">Case Studies</span></a>
				</li>
				<li style="padding-top: 14px;">
					<a href="#plays-in-detail"><span class="toc-heading" style="font-weight: 600;">Plays in Detail</span></a>
				</li>
				<li>
					<a href="#convene">Convene</a>
					<ul class="nav">
						<li><a href="#convene-small-groups">Small Groups</a></li>
						<li><a href="#convene-lunch-and-learns">Lunch &amp; Learns</a></li>
						<li><a href="#convene-professional-development">Professional Development</a></li>
						<li><a href="#convene-occasional-large-events">Network Engagement Events</a></li>
						<li><a href="#convene-annual-conferences">Annual Conferences</a></li>
						<li><a href="#convene-external-speakers">External Speakers</a></li>
					</ul>
				</li>
				<li>
					<a href="#catalyze">Catalyze</a>
					<ul class="nav">
						<li><a href="#catalyze-catalytic-grants">Catalytic Grants</a></li>
						<li><a href="#catalyze-project-assistance">Project Assistance</a></li>
						<li><a href="#catalyze-fellowships">Research Fellows</a></li>
						<li><a href="#catalyze-rfps">Request for Proposals</a></li>
						<li><a href="#catalyze-incubate-ventures">Incubate Ventures</a></li>
						<li><a href="#catalyze-national-funding-support">National Funding Support</a></li>
					</ul>
				</li>
				<li>
					<a href="#communicate">Communicate</a>
					<ul class="nav">
						<li><a href="#communicate-blog">Blog</a></li>
						<li><a href="#communicate-social-media">Social Media</a></li>
						<li><a href="#communicate-conference-presentations">Conference Participation</a></li>
						<li><a href="#communicate-directory">Directory</a></li>
						<li><a href="#communicate-youth-voice">Amplify Youth Voice</a></li>
						<li><a href="#communicate-newsletter">Newsletter</a></li>
						<li><a href="#communicate-documentation-storytelling">Documentation &amp; Storytelling</a></li>
						<li><a href="#communicate-press-outreach">Press Outreach</a></li>
						<li><a href="#communicate-publications">Publications</a></li>
						<li><a href="#communicate-local-to-national">From Local to National</a></li>
					</ul>
				</li>
				<li>
					<a href="#coordinate">Coordinate</a>
					<ul class="nav">
						<li><a href="#coordinate-program-cooperation">Program Cooperation</a></li>
						<li><a href="#coordinate-national-to-local">From National to Local</a></li>
						<li><a href="#coordinate-strategy">Network Strategy</a></li>
						<li><a href="#coordinate-research">Network Research</a></li>
					</ul>
				</li>
				<li>
					<a href="#champion">Champion</a>
					<ul class="nav">
						<li><a href="#champion-showcase">Showcase</a></li>
						<li><a href="#champion-event-sponsorship">Event Sponsorship</a></li>
						<li><a href="#champion-awards">Awards</a></li>
						<li><a href="#champion-advertising-marketing">Advertising &amp; Marketing</a></li>
						<li><a href="#champion-network-gatherings">Network Gatherings</a></li>
					</ul>
				</li>
				<li style="padding-top: 14px;">
					<a href="playbook.html#additional-resources"><span class="toc-heading" style="font-weight: 600;">Additional Resources</span></a>
				</li>
				<li style="padding-top: 14px;">
					<a href="playbook.html#acknowledgements">Acknowledgements</a>
				</li>
				<li><a href="#order-form">Order Free Copy</a></li>
				<li><a href="#license">License</a></li>							
				<li><a href="#contact-us-about-the-playbook">Contact</a></li>							
			</ul>
			<a class="back-to-top" href="#top">
				Back to top
			</a>
		</nav>		
	</xsl:variable>
	<xsl:variable name="top_case-studies">
		<div class="bs-docs-section">
			<header>
				<h1 id="case-studies" class="page-header">Case Studies</h1>
			</header>
			<p>These are case studies of <em>learning remade</em> in Pittsburgh. We invite you to explore the innovation enabled by the <a href="http://remakelearning.org/network">Remake Learning Network</a> in several educational contexts:</p>
			<div class="block-grid-xs-1 block-grid-sm-2 block-grid-md-3 block-grid-lg-3 ">
				<div class="block-grid-item">
					<a href="case-studies.html#assemble" class="thumbnail">
						<img data-src="http://gameplan.remakelearning.org/data/photos/cases/assemble/20120509170806_sized300x200.jpg" class="img-responsive"/>
						<div class="caption">
							<div class="caption-inner">
								<p><em>In Neighborhoods</em></p>
								<p><strong>Assemble</strong> creates art and technology opportunities for young people to make things that inspire and empower.</p>
							</div>
						</div>
					</a>
				</div>
				<div class="block-grid-item">
					<a href="case-studies.html#birdbrain-technologies" class="thumbnail">
						<img data-src="http://gameplan.remakelearning.org/data/photos/cases/birdbrain-technologies/20140610163028_sized300x200.jpg" class="img-responsive"/>
						<div class="caption">
							<div class="caption-inner">
								<p><em>With Ed-Tech</em></p>
								<p><strong>BirdBrain Technologies</strong> creates affordable robotics tools that help teachers make coding and computer science accessible.</p>
							</div>
						</div>
					</a>
				</div>
				<div class="block-grid-item">
					<a href="case-studies.html#carnegie-mellon-university" class="thumbnail">
						<img data-src="http://gameplan.remakelearning.org/data/photos/cases/carnegie-mellon-university/NODATE0002_sized300x200.jpg" class="img-responsive"/>
						<div class="caption">
							<div class="caption-inner">
								<p><em>In Higher Education</em></p>
								<p><strong>Carnegie Mellon</strong> connects university students and researchers to the communities they serve.</p>
							</div>
						</div>
					</a>
				</div>
				<div class="block-grid-item">
					<a href="case-studies.html#childrens-innovation-project" class="thumbnail">
						<img data-src="http://gameplan.remakelearning.org/data/photos/cases/childrens-innovation-project/20120203152759_sized300x200.jpg" class="img-responsive"/>
						<div class="caption">
							<div class="caption-inner">
								<p><em>By School Teachers</em></p>
								<p><strong>The Children’s Innovation Project</strong> helps children to develop habits of mind as innovators.</p>
							</div>
						</div>
					</a>
				</div>
				<div class="block-grid-item">
					<a href="case-studies.html#city-of-learning" class="thumbnail">
						<img data-src="http://gameplan.remakelearning.org/data/photos/cases/city-of-learning/20140717083315_0001_300x200.jpg" class="img-responsive"/>
						<div class="caption">
							<div class="caption-inner">
								<p><em>With Digital Badges</em></p>
								<p>Dozens of community partners helped Pittsburgh become a summertime <strong>City of Learning</strong>.</p>
							</div>
						</div>
					</a>
				</div>
				<div class="block-grid-item">
					<a href="case-studies.html#digital-corps" class="thumbnail">
						<img data-src="http://gameplan.remakelearning.org/data/photos/cases/digital-corps/20140505170101_sized300x200.jpg" class="img-responsive"/>
						<div class="caption">
							<div class="caption-inner">
								<p><em>With Mentors</em></p>
								<p><strong>The Digital Corps</strong> are technology guides who engage Pittsburgh youth in digital literacy.</p>
							</div>
						</div>
					</a>
				</div>
				<div class="block-grid-item">
					<a href="case-studies.html#elizabeth-forward-school-district" class="thumbnail">
						<img data-src="http://gameplan.remakelearning.org/data/photos/cases/elizabeth-forward-school-district/NODATE0006_sized300x200.jpg" class="img-responsive"/>
						<div class="caption">
							<div class="caption-inner">
								<p><em>By District Administrators</em></p>
								<p><strong>Elizabeth Forward</strong> empowers educators and students to re-imagine the future of education and then make it a reality.</p>
							</div>
						</div>
					</a>
				</div>
				<div class="block-grid-item">
					<a href="case-studies.html#labs-at-clp" class="thumbnail">
						<img data-src="http://gameplan.remakelearning.org/data/photos/cases/labs-at-clp/NODATE0003_sized300x200.jpg" class="img-responsive"/>
						<div class="caption">
							<div class="caption-inner">
								<p><em>In Libraries</em></p>
								<p><strong>The Labs</strong> is transforming the Carnegie Library of Pittsburgh into a laboratory of exploration, learning, and discovery.</p>
							</div>
						</div>
					</a>
				</div>
				<div class="block-grid-item">
					<a href="case-studies.html#maker-party" class="thumbnail">
						<img data-src="http://gameplan.remakelearning.org/data/photos/cases/maker-party/NODATE0009_sized300x200.jpg" class="img-responsive"/>
						<div class="caption">
							<div class="caption-inner">
								<p><em>At Events</em></p>
								<p><strong>Maker Parties</strong> create free events for anyone to engage with hands-on learning activities that are fun and creative.</p>
							</div>
						</div>
					</a>
				</div>
				<div class="block-grid-item">
					<a href="case-studies.html#makeshop" class="thumbnail">
						<img data-src="http://gameplan.remakelearning.org/data/photos/cases/makeshop/20120116133642_sized300x200.jpg" class="img-responsive"/>
						<div class="caption">
							<div class="caption-inner">
								<p><em>In Museums</em></p>
								<p><strong>MAKESHOP</strong> at the Children’s Museum of Pittsburgh creates space for kids to use their hands and minds to bring ideas to life.</p>
							</div>
						</div>
					</a>
				</div>
				<div class="block-grid-item">
					<a href="case-studies.html#transformed" class="thumbnail">
						<img data-src="http://gameplan.remakelearning.org/data/photos/cases/transformed/NODATE0012_sized300x200.jpg" class="img-responsive"/>
						<div class="caption">
							<div class="caption-inner">
								<p><em>In Professional Development</em></p>
								<p><strong>transformED</strong> reimagines the look, feel, and purpose of professional development for teachers.</p>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</xsl:variable>
	<xsl:variable name="top_plays-in-detail">
		<div class="bs-docs-section">
			<header>
				<h1 id="plays-in-detail" class="page-header">Plays in Detail</h1>
			</header>
			<p>These are details on the plays of the <a href="http://remakelearning.org/network">Remake Learning Network</a>. These network support strategies have been organized into five action areas:</p>
			<ul>
				<li><a href="plays-in-detail.html#convene">Convene</a> a community of practice;</li> 
				<li><a href="plays-in-detail.html#catalyze">Catalyze</a> innovative learning projects;</li> 
				<li><a href="plays-in-detail.html#communicate">Communicate</a> within and outside the network;</li> 
				<li><a href="plays-in-detail.html#coordinate">Coordinate</a> network members to maximize impact; and,</li> 
				<li><a href="plays-in-detail.html#champion">Champion</a> the network’s accomplishments.</li>
			</ul>
		</div>
	</xsl:variable>
	<xsl:variable name="order-form">
		<article class="bs-docs-section clearfix" id="order-form">
			<h1 id="order-form" class="page-header">Order Free Copy</h1>
			<p class="lead">Use the form below to order your free copy of the Remake Learning Playbook!</p>
			<div class="well">
				<h5 class="text-muted" style="margin-top: 0;"><i class="fa fa-info-circle"></i> PLEASE NOTE</h5>
				<p>Up to 5 copies of the Remake Learning Playbook may be ordered using this form.</p>
				<p>Free shipping to the United States and Canada. For larger orders or for international address, shipping charges may apply; please contact <a href="mailto:playbook@sproutfund.org">playbook@sproutfund.org</a>.</p>		
			</div>
			<div class="panel panel-default">
				<div class="panel-body">
					<p class="text-danger"><span>*</span> Required Fields</p>
					<form action="https://docs.google.com/forms/d/1GaQuO1hBDKqNgeb11lJZXgngs_oECfr7dUZGx2lowmg/formResponse" id="ss-form" method="post" name="ss-form" onsubmit="" target="_blank">
						<section id="order-details">
							<h2 id="order-details">Order Details</h2>
							<div class="form-group">
								<label for="entry_1407165416">How many copies would you like to receive?<span class="text-danger">*</span></label>
								<select class="form-control" id="entry_1407165416" name="entry.1407165416">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
								</select>
							</div>
						</section>
						<section id="order-name-affiliation">
							<h2 id="order-name-affiliation">Name &amp; Affiliation</h2>
							<div class="row">
								<div class="col-xs-12 col-sm-6">
									<div class="form-group">
										<label class="control-label" for="entry_1927036416">First Name<span class="text-danger">*</span></label>
										<input type="text" class="form-control" id="entry_1927036416" name="entry.1927036416" required="true" placeholder="First Name"/>
									</div>
								</div>
								<div class="col-xs-12 col-sm-6">
									<div class="form-group">
										<label class="control-label" for="entry_1962007093">Last Name<span class="text-danger">*</span></label>
										<input type="text" class="form-control" id="entry_1962007093" name="entry.1962007093" required="true" placeholder="Last Name"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12 col-sm-6">
									<div class="form-group">
										<label class="control-label" for="entry_539402360">Organization/Affiliation</label>
										<input type="text" class="form-control" id="entry_539402360" name="entry.539402360" placeholder="Organization/Affiliation"/>
									</div>
								</div>
								<div class="col-xs-12 col-sm-6">
									<div class="form-group">
										<label class="control-label" for="entry_454856313">Region/Location/Hometown</label>
										<input type="text" class="form-control" id="entry_454856313" name="entry.454856313" placeholder="Region/Location/Hometown"/>
									</div>
								</div>
							</div>
						</section>
						<section id="order-mailing-address">
							<h2 id="order-mailing-address">Mailing Address</h2>
							<div class="row">
								<div class="col-xs-12">
									<div class="form-group">
										<label class="control-label" for="entry_2087925748">Street Address<span class="text-danger">*</span></label>
										<input type="text" class="form-control" id="entry_2087925748" name="entry.2087925748" required="true" placeholder="Street Address"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12 col-sm-6">
									<div class="form-group">
										<label class="control-label" for="entry_1848092994">City<span class="text-danger">*</span></label>
										<input type="text" class="form-control" id="entry_1848092994" name="entry.1848092994" required="true" placeholder="City"/>
									</div>
								</div>
								<div class="col-xs-12 col-sm-6">
									<div class="form-group">
										<label for="entry_1407165416">State/Province<span class="text-danger">*</span></label>
										<select class="form-control" id="entry_1370326096" name="entry.1370326096" required="true">
											<option></option>
											<option value="AB">Alberta</option>
											<option value="AK">Alaska</option>
											<option value="AL">Alabama</option>
											<option value="AR">Arkansas</option>
											<option value="AS">American Samoa</option>
											<option value="AZ">Arizona</option>
											<option value="BC">British Columbia</option>
											<option value="CA">California</option>
											<option value="CO">Colorado</option>
											<option value="CT">Connecticut</option>
											<option value="DC">District of Columbia</option>
											<option value="DE">Delaware</option>
											<option value="FL">Florida</option>
											<option value="GA">Georgia</option>
											<option value="GU">Guam</option>
											<option value="HI">Hawaii</option>
											<option value="IA">Iowa</option>
											<option value="ID">Idaho</option>
											<option value="IL">Illinois</option>
											<option value="IN">Indiana</option>
											<option value="KS">Kansas</option>
											<option value="KY">Kentucky</option>
											<option value="LA">Louisiana</option>
											<option value="MA">Massachusetts</option>
											<option value="MB">Manitoba</option>
											<option value="MD">Maryland</option>
											<option value="ME">Maine</option>
											<option value="MI">Michigan</option>
											<option value="MN">Minnesota</option>
											<option value="MO">Missouri</option>
											<option value="MP">Northern Mariana Islands</option>
											<option value="MS">Mississippi</option>
											<option value="MT">Montana</option>
											<option value="NB">New Brunswick</option>
											<option value="NC">North Carolina</option>
											<option value="ND">North Dakota</option>
											<option value="NE">Nebraska</option>
											<option value="NH">New Hampshire</option>
											<option value="NJ">New Jersey</option>
											<option value="NL">Newfoundland and Labrador</option>
											<option value="NM">New Mexico</option>
											<option value="NS">Nova Scotia</option>
											<option value="NT">Northwest Territories</option>
											<option value="NU">Nunavut</option>
											<option value="NV">Nevada</option>
											<option value="NY">New York</option>
											<option value="OH">Ohio</option>
											<option value="OK">Oklahoma</option>
											<option value="ON">Ontario</option>
											<option value="OR">Oregon</option>
											<option value="PA">Pennsylvania</option>
											<option value="PE">Prince Edward Island</option>
											<option value="PR">Puerto Rico</option>
											<option value="QC">Quebec</option>
											<option value="RI">Rhode Island</option>
											<option value="SC">South Carolina</option>
											<option value="SD">South Dakota</option>
											<option value="SK">Saskatchewan</option>
											<option value="TN">Tennessee</option>
											<option value="TX">Texas</option>
											<option value="UM">United States Minor Outlying Islands</option>
											<option value="UT">Utah</option>
											<option value="VA">Virginia</option>
											<option value="VI">Virgin Islands</option>
											<option value="VT">Vermont</option>
											<option value="WA">Washington</option>
											<option value="WI">Wisconsin</option>
											<option value="WV">West Virginia</option>
											<option value="WY">Wyoming</option>
											<option value="YT">Yukon</option>
											<option value="AA">Armed Forces Americas</option>
											<option value="AP">Armed Forces Pacific</option>
											<option value="AE">Armed Forces Others</option>
										</select>
									</div>
								</div>
								<div class="col-xs-12 col-sm-6">
									<div class="form-group">
										<label class="control-label" for="entry_1038278789">Postal Code<span class="text-danger">*</span></label>
										<input type="text" class="form-control" id="entry_1038278789" name="entry.1038278789" required="true" placeholder="Postal Code"/>
									</div>
								</div>
								<div class="col-xs-12 col-sm-6">
									<div class="form-group">
										<label for="entry_819810259">Country<span class="text-danger">*</span></label>
										<select class="form-control" id="entry_819810259" name="entry.819810259" required="true" aria-describedby="help-block_country">
											<option></option>
											<option value="United States">United States</option>
											<option value="Canada">Canada</option>
										</select>
										<span id="help-block_country" class="help-block">U.S. &amp; Canada only</span>
									</div>
								</div>
							</div>
						</section>
						<section id="order-email-twitter">
							<h2 id="order-email-twitter">Email &amp; Twitter</h2>
							<div class="row">
								<div class="col-xs-12 col-sm-6">
									<div class="form-group">
										<label class="control-label" for="entry_933421854">Email Address<span class="text-danger">*</span></label>
										<input type="email" class="form-control" id="entry_933421854" name="entry.933421854" required="true" placeholder="Email Address" aria-describedby="help-block_email"/>
										<span id="help-block_email" class="help-block">for order updates</span>
									</div>						
								</div>
								<div class="col-xs-12 col-sm-6">
									<div class="form-group">
										<label class="control-label" for="entry_1399566777">Twitter Username</label>
										<div class="input-group">
											<span class="input-group-addon">@</span>
											<input type="text" class="form-control" id="entry_1399566777" name="entry.1399566777" placeholder="Twitter Username" aria-describedby="help-block_twitter"/>
										</div>
										<span id="help-block_twitter" class="help-block">get a shout-out from <a href="https://twitter.com/remakelearning/" target="_blank">@remakelearning</a>!</span>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 1rem;">
								<div class="col-xs-12">
									<label class="control-label" style="font-size: larger; margin-right: 2rem;">Subscribe to Remake Learning email updates?</label>
									<label class="radio-inline" style="font-size: larger;">
										<input type="radio" id="group_767287940_1" name="entry.767287940" value="Yes"/> Yes
									</label>
									<label class="radio-inline" style="font-size: larger;">
										<input type="radio" id="group_767287940_2" name="entry.767287940" value="No"/> No
									</label>
								</div>
							</div>
						</section>
						<section id="order-submit" class="clearfix" style="margin-top: 3rem;">
							<div class="row">
								<div class="col-xs-12 col-sm-4 col-sm-offset-4">
									<input name="fbzx" type="hidden" value="-189894302988002900"/>
									<input type="submit" class="btn btn-default btn-lg btn-block" value="Submit Order" name="subscribe" id="ss-submit"/>
								</div>
							</div>
						</section>
					</form>					
				</div>
			</div>
			<div class="well">
				<h5 class="text-muted" style="margin-top: 0;"><i class="fa fa-plus-circle"></i> SUPPORT THIS WORK</h5>
				<p>Did you find the Remake Learning Playbook a useful tool? Help us do more! Please consider making a tax-deductible contribution to <strong>The Sprout Fund</strong>.</p>
				<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank">
					<input type="hidden" name="cmd" value="_s-xclick"/>
					<input type="hidden" name="hosted_button_id" value="BWA528UD25RSW"/>
					<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!" class="center-block"/>
					<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1"/>
				</form>
			</div>
		</article>
	</xsl:variable>
	<xsl:variable name="license">
		<!--License-->
		<section id="license" class="bs-docs-section">
			<h1 class="page-header">License</h1>
			<p class="lead">This work by <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">The Sprout Fund</span> is licensed under a <a rel="license" target="_blank" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.</p>
			<p><a rel="license" target="_blank" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png"/></a></p>			
		</section>
	</xsl:variable>
	<xsl:variable name="contact">
		<!--Contact Us-->
		<section id="contact-us-about-the-playbook" class="bs-docs-section">
			<h1 id="contact-playbook" class="page-header">Contact Us</h1>
			<p>Did you find this work useful? Tweet at <a href="http://twitter.com/remakelearning">@remakelearning</a> or <a href="http://twitter.com/sproutfund">@sproutfund</a> to let us know!</p>
			<p>Questions or comments? Contact <a href="mailto:playbook@sproutfund.org">playbook@sproutfund.org</a>.</p>			
		</section>
	</xsl:variable>
	<xsl:variable name="footers">
		<!-- Funders Footer -->
		<footer class="container-fluid no-gutter" id="footer-funders">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-10 col-lg-offset-1 col-xl-8 col-xl-offset-2">
				<p style="text-align: center; text-transform: uppercase; padding-bottom: 10px;">Support for Remake Learning Generously Provided By</p>
				<div class="row">
					<div class="col-xs-6 col-sm-4 col-md-2"><!--Grable-->
						<a title="The Grable Foundation" href="http://grable.org/" target="_blank">
							<img src="http://cloudfront.sproutfund.org/files/2014/10/Grable-greyscale_footer_150x100.png" class="footer-logo img-responsive"/>
						</a>
					</div>
					<div class="col-xs-6 col-sm-4 col-md-2"><!--MacArthur-->
						<a title="John D. and Catherine T. MacArthur Foundation" href="http://www.macfound.org/" target="_blank">
							<img src="http://cloudfront.sproutfund.org/files/2014/10/macarthur_footer_125x85.png" class="footer-logo img-responsive"/>
						</a>
					</div>
					<div class="col-xs-6 col-sm-4 col-md-2"><!--Benedum-->
						<a title="Claude Worthington Benedum Foundation" href="http://www.benedum.org/" target="_blank">
							<img src="http://cloudfront.sproutfund.org/files/2014/10/benedum-grayscale_footer.png" class="footer-logo img-responsive"/>
						</a>
					</div>
					<div class="col-xs-6 col-sm-4 col-md-2"><!--Hillman-->
						<a title="Hillman Foundation" href="http://hillmanfamilyfoundations.org/foundations/hillman-foundation/" target="_blank">
							<img src="http://cloudfront.sproutfund.org/files/2014/10/hillman-grayscale_footer.png" class="footer-logo img-responsive"/>
						</a>
					</div>
					<div class="col-xs-6 col-sm-4 col-md-2"><!--McCune-->
						<a title="McCune Foundation" href="http://www.mccune.org/" target="_blank">
							<img src="http://cloudfront.sproutfund.org/files/2014/10/mccune-grayscale_footer.png" class="footer-logo img-responsive"/>
						</a>
					</div>
					<div class="col-xs-6 col-sm-4 col-md-2"><!--Pittsburgh-->
						<a title="The Pittsburgh Foundation" href="http://www.pittsburghfoundation.org/" target="_blank">
							<img src="http://cloudfront.sproutfund.org/files/2014/10/pgh-fdn-grayscale_footer_150x100.png" class="footer-logo img-responsive"/>
						</a>
					</div>
				</div>
			</div>
		</footer>
		<!-- About Footer -->
		<footer class="container-fluid no-gutter" id="footer-about-contact">
			<!--<div class="col-xs-12 col-sm-12 col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2">-->
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-10 col-lg-offset-1 col-xl-8 col-xl-offset-2">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xs-12 col-sm-8">
							<h3>About the Remake Learning Network</h3>
							<p class="body-text">Representing more than 200 organizations, Remake Learning is a professional network of schools, museums, libraries, afterschool programs, community centers, higher education institutions, education technology companies, philanthropies, and civic leaders working together to inspire a generation of lifelong learners in Pittsburgh, West Virginia, and beyond.</p>
							<p class="body-text">With millions of dollars invested, thousands of children engaged, and hundreds of practitioners leading dozens of projects, Remake Learning is yielding tangible results for children and youth in communities throughout the region.</p>
							<p class="body-text">Learn more about the <a target="_blank" href="http://remakelearning.org/network/">network</a> and the <a href="http://remakelearning.org/case-studies/">impact</a> of our work.</p>
						</div>
						<div class="col-xs-12 col-sm-4">
							<h3 id="contact">Contact Us</h3>
							<p class="body-text"><strong>Remake Learning</strong> is managed by the staff of <a href="http://www.sproutfund.org" target="_blank">The Sprout Fund</a>.</p>
							<ul style="list-style: none; padding-left: .25rem;">
								<li class="icon-map-marker">5423 Penn Ave, Pittsburgh, PA 15206</li>
								<li class="icon-phone">412-325-0646</li>
								<li class="icon-envelope"><a href="mailto:info@remakelearning.org">info@remakelearning.org</a></li>
								<li class="icon-twitter"><a href="http://twitter.com/remakelearning" target="_blank">@remakelearning</a></li>
							</ul>
							<p class="body-text">For press inquiries or to request materials, visit the <a href="http://remakelearning.org/media-room/">Media Room</a>.</p>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<!-- License Footer -->
		<footer class="container-fluid no-gutter" id="footer-license">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-10 col-lg-offset-1 col-xl-8 col-xl-offset-2">
				<div class="container-fluid">
					<a title="The Remake Learning Playbook is internationally licensed as Creative Commons Attribution-ShareAlike 4.0" rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">
						<img alt="Creative Commons License" style="border:0;" src="https://i.creativecommons.org/l/by-sa/4.0/80x15.png"/>
					</a>
					<span class="license-text" style="color: #bbbbbb; margin-left: 8px;">Internationally licensed as Creative Commons Attribution-ShareAlike 4.0</span>
				</div>
			</div>
		</footer>
		
		<!-- External JavaScript -->
		<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" integrity="sha256-Sk3nkD6mLTMOF0EOpNtsIry+s1CsaqQC1rVLTAy+0yc= sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ==" crossorigin="anonymous"></script>
		<script src="http://gameplan.remakelearning.org/js/bootstrap-docs.min.js"></script>
		<!--<script src="http://gameplan.remakelearning.org/js/foundation.js"></script>-->
		<!--<script src="http://gameplan.remakelearning.org/js/foundation.equalizer.js"></script>-->
		<!--<script src="http://gameplan.remakelearning.org/js/jquery.equalizer.js"></script>-->
		<script src="http://gameplan.remakelearning.org/js/bootstrap-toggle.js"></script>
		<script src="http://gameplan.remakelearning.org/js/bootstrap-combobox.js"></script>
		<!--
		<script src="http://gameplan.remakelearning.org/js/dataTables.js"></script>
		<script src="http://gameplan.remakelearning.org/js/dataTables.bootstrap.js"></script>
		-->
		<script src="https://cdn.jsdelivr.net/jquery.lazyloadxt/1.0.4/jquery.lazyloadxt.extra.min.js"></script>
		<script src="https://cdn.jsdelivr.net/jquery.lazyloadxt/1.0.4/jquery.lazyloadxt.print.min.js"></script>
		<!--<script src="https://cdn.jsdelivr.net/jquery.lazyloadxt/1.0.4/jquery.lazyloadxt.autoload.min.js"></script>-->
		
		<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
		<script src="http://gameplan.remakelearning.org/js/bootstrap-ie10-viewport-bug-workaround.js"></script>
		
		<!-- jQuery Add-ons Standard Settings 
		<script type="text/javascript">
		</script>-->
		
		<!-- Foundation Equalizer 
		<script type="text/javascript">jQuery(window).resize(function(){jQuery(document).foundation('equalizer','reflow');});jQuery(document).foundation({equalizer:{equalize_on_stack:false}});</script> -->
		
		<!-- Google Analytics -->
		<script type="text/javascript">(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','http://www.google-analytics.com/analytics.js','ga');ga('create', 'UA-8341602-5', 'auto');ga('send', 'pageview');</script>
		
		<!-- Custom Scripting 
		<script type="text/javascript">
		</script>-->
	</xsl:variable>

	<xsl:template match="/">
		<html lang="en">
			<head>
				<xsl:copy-of select="$head" />
			</head>
			<body>
				<xsl:copy-of select="$navbar" />
				<xsl:copy-of select="$masthead" />
				<xsl:choose>
					<xsl:when test="/playbook">
						<xsl:copy-of select="$share_chapters" />
					</xsl:when>
					<xsl:when test="/cases">
						<xsl:copy-of select="$share_case-studies" />
					</xsl:when>
					<xsl:when test="/plays">
						<xsl:copy-of select="$share_plays-in-detail" />
					</xsl:when>
				</xsl:choose>

				<!-- Content -->
				<section id="content" class="container-fluid bs-docs-container">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-10 col-lg-offset-1 col-xl-8 col-xl-offset-2">
						<div class="row">
							<xsl:apply-templates/>
						</div>
					</div>
				</section><!--#content.container-fluid-->
				
				<xsl:copy-of select="$footers" />
				
			</body>
		</html>			
	</xsl:template>
	
	<xsl:template match="playbook">
		<div class="hidden-xs hidden-sm col-md-3" role="complementary">
			<xsl:copy-of select="$toc_chapters" />
		</div>
		<div class="col-xs-12 col-sm-12 col-md-9" role="main">
			<section id="about" class="bs-docs-section playbook_about clearfix">
				<xsl:copy-of select="$about-text" />
				<xsl:copy-of select="$about-updates" />
				<section id="toc-print" class="bs-docs-section clearfix visible-xs-block visible-sm-block">
					<header>
						<h1 id="toc" class="page-header">Table of Contents</h1>
					</header>
					<h3 id="toc-print_chapters">Playbook Chapters</h3>
					<xsl:copy-of select="$toc-print_chapters" />
					<h3 id="toc-print_case-studies"><a href="case-studies.html#case-studies">Case Studies</a></h3>
					<h3 id="toc-print_plays-in-detail"><a href="plays-in-detail.html#plays-in-detail">Plays in Detail</a></h3>
					<p id="toc-print-additional-resources" class="toc-print" style="margin-top: 2.5rem;">
						<a href="playbook.html#additional-resources">Additional Resources</a>
						<ul class="fa-ul">
							<li>
								<i class="fa-li fa fa-caret-right"></i><a href="playbook.html#advocacy-kit">Advocacy Kit</a>
							</li>
							<li>
								<i class="fa-li fa fa-caret-right"></i><a href="playbook.html#gameplan-web-app">Gameplan Web App</a>
							</li>
						</ul>
					</p>
					<p id="toc-print-acknowledgements" class="toc-print">
						<a href="playbook.html#acknowledgements">Acknowledgements</a>
					</p>
					<p id="toc-print-license" class="toc-print">
						<a href="playbook.html#license">License</a>
					</p>
					<p id="toc-print-contact" class="toc-print">
						<a href="playbook.html#contact-us-about-the-playbook">Contact</a>
					</p>
				</section>
			</section>
			<section id="chapters" class="bs-docs-section playbook_chapters clearfix">
				<header style="display: none;">
					<h1 id="chapters" class="page-header">Playbook Chapters</h1>
				</header>
				<xsl:for-each select="chapters/chapter">
					<article class="bs-docs-section playbook_chapter clearfix">
						<xsl:attribute name="id">
							<xsl:value-of select="@id"/>
						</xsl:attribute>
						<xsl:copy-of select="./node()" />
						<xsl:if test="@medium-url">
							<div class="well" style="margin-top: 2rem;"><i class="fa fa-lg fa-medium" style="margin-right: 1rem;"></i>Add your comments and feedback about this chapter on <a target="_blank"><xsl:attribute name="href"><xsl:value-of select="@medium-url"/></xsl:attribute>Medium</a>.</div>
						</xsl:if>
					</article>
				</xsl:for-each>
			</section>
			<section id="case-studies" class="bs-docs-section playbook_case-studies clearfix">
				<xsl:copy-of select="$top_case-studies" />
			</section>
			<section id="plays-in-detail" class="bs-docs-section playbook_plays-in-detail clearfix">
				<xsl:copy-of select="$top_plays-in-detail" />
			</section>
			<section id="additional-resources" class="bs-docs-section playbook_resources clearfix">
				<xsl:copy-of select="additional-resources/node()" />
			</section>
			<section id="acknowledgements" class="bs-docs-section clearfix">
				<xsl:copy-of select="acknowledgements/node()" />
			</section>
			<xsl:copy-of select="$order-form" />
			<xsl:copy-of select="$license" />
			<xsl:copy-of select="$contact" />
		</div>
	</xsl:template>
	
	<xsl:template match="cases">
		<div class="hidden-xs hidden-sm col-md-3" role="complementary">
			<xsl:copy-of select="$toc_case-studies" />
		</div>
		<div class="col-xs-12 col-sm-12 col-md-9" role="main">
			<section id="about" class="bs-docs-section playbook_about clearfix">
				<xsl:copy-of select="$about-text" />
			</section>
			<section id="chapters" class="bs-docs-section playbook_chapters clearfix">
				<header>
					<h1 id="chapters" class="page-header">Playbook Chapters</h1>
				</header>
				<xsl:copy-of select="$toc-print_chapters" />
			</section>
			<section id="case-studies" class="bs-docs-section playbook_case-studies clearfix">
				<xsl:copy-of select="$top_case-studies" />
				<xsl:for-each select="case">
					<xsl:comment><xsl:value-of select="name"/></xsl:comment>
					<article class="bs-docs-section playbook_case-study clearfix">
						<xsl:attribute name="id">
							<xsl:value-of select="@slug"/>
						</xsl:attribute>
						<header>
							<h1 class="page-header">
								<xsl:attribute name="id"><xsl:value-of select="@slug"/></xsl:attribute>							
								<small class="toc-heading"><xsl:value-of select="name"/></small>
								<br/>
								<xsl:copy-of select="title/node()"/>
							</h1>
							<div class="embed-responsive embed-responsive-16by9">
								<iframe class="embed-responsive-item" webkitallowfullscreen="true" mozallowfullscreen="true" allowfullscreen="true">
									<xsl:attribute name="data-src"><xsl:value-of select="youtube/@embed"/>?rel=0</xsl:attribute>
								</iframe>
							</div>
							<p class="lead"><xsl:copy-of select="teaser/node()"/></p>
						</header>
						<xsl:if test="text">
							<section class="playbook_case-study_text">
								<xsl:attribute name="id"><xsl:value-of select="@slug"/>-text</xsl:attribute>
								<xsl:if test="additional_content/by_the_numbers">
									<aside class="playbook_case-study_by-the-numbers no-gutter-xs no-gutter-right col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 pull-right">
										<xsl:attribute name="id"><xsl:value-of select="@slug"/>-by-the-numbers</xsl:attribute>
										<div class="panel panel-default">
											<div class="panel-heading">By the Numbers</div>
											<div class="panel-body">
												<xsl:copy-of select="additional_content/by_the_numbers/node()"/>
											</div>
										</div>
									</aside>
								</xsl:if>
								<xsl:copy-of select="text/node()"/>
								<xsl:if test="text/@author">
									<p class="playbook_case-study_text-author">by <xsl:value-of select="text/@author"/></p>
								</xsl:if>
							</section>
						</xsl:if>
						<xsl:if test="additional_content/network_in_action">
							<section class="playbook_case-study_network-in-action">
								<xsl:attribute name="id"><xsl:value-of select="@slug"/>-network-in-action</xsl:attribute>
								<xsl:for-each select="additional_content/network_in_action">
									<div class="panel panel-default">
										<div class="panel-heading"><strong>Network in Action</strong>: <xsl:value-of select="@summary"/> (<em style="text-transform: capitalize;"><xsl:value-of select="@action_area"/></em>)</div>
										<div class="panel-body">
											<xsl:copy-of select="./node()"/>
										</div>
									</div>
								</xsl:for-each>
							</section>
						</xsl:if>
						<xsl:if test="additional_content/person_of_interest">
							<section class="playbook_case-study_person-of-interest">
								<xsl:attribute name="id"><xsl:value-of select="@slug"/>-person-of-interest</xsl:attribute>
								<xsl:choose>
									<xsl:when test="count(additional_content/person_of_interest)>1">
										<h3>Persons of Interest</h3>
									</xsl:when>
									<xsl:otherwise>
										<h3>Person of Interest</h3>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:for-each select="additional_content/person_of_interest">
									<div class="col-xs-12 col-sm-6 col-md-4 no-gutter-xs no-gutter-right pull-right">
										<div class="thumbnail">
											<img class="img-responsive">
												<xsl:attribute name="src">http://gameplan.remakelearning.org/data/photos/headshots/<xsl:value-of select="@slug"/>_300x200.jpg</xsl:attribute>
												<xsl:attribute name="alt"><xsl:value-of select="@name"/></xsl:attribute>
												<xsl:attribute name="title"><xsl:value-of select="@name"/></xsl:attribute>
											</img>
										</div>
									</div>
									<h4><xsl:value-of select="@name"/></h4>
									<xsl:copy-of select="./node()"/>
								</xsl:for-each>
							</section>
						</xsl:if>
						<section class="playbook_case-study_more-info">
							<xsl:attribute name="id"><xsl:value-of select="@slug"/>-more-info</xsl:attribute>
							<h3>More Information</h3>
							<xsl:copy-of select="additional_content/for_more_info/node()"/>
							<xsl:if test="additional_content/downloadable_materials and additional_content/online_resources and additional_content/related_projects_partners">
								<div class="panel panel-default">
									<div class="panel-body">
										<ul class="nav nav-pills" role="tablist">
											<li role="presentation" class="active">
												<a role="tab" data-toggle="tab">
													<xsl:attribute name="href"         >#<xsl:value-of select="@slug"/>-downloadable-materials</xsl:attribute>
													<xsl:attribute name="aria-controls" ><xsl:value-of select="@slug"/>-downloadable-materials</xsl:attribute>
													Downloadable Materials
												</a>
											</li>
											<li role="presentation">
												<a role="tab" data-toggle="tab">
													<xsl:attribute name="href"         >#<xsl:value-of select="@slug"/>-online-resources</xsl:attribute>
													<xsl:attribute name="aria-controls" ><xsl:value-of select="@slug"/>-online-resources</xsl:attribute>
													Online Resources
												</a>
											</li>
											<li role="presentation">
												<a role="tab" data-toggle="tab">
													<xsl:attribute name="href"         >#<xsl:value-of select="@slug"/>-related-projects-partners</xsl:attribute>
													<xsl:attribute name="aria-controls" ><xsl:value-of select="@slug"/>-related-projects-partners</xsl:attribute>
													Related Projects &amp; Partners
												</a>
											</li>
										</ul>
										<div class="tab-content">
											<div role="tabpanel" class="tab-pane playbook_case-study_downloadable-materials active">
												<xsl:attribute name="id"><xsl:value-of select="@slug"/>-downloadable-materials</xsl:attribute>
												<ul class="list-group">
													<xsl:for-each select="additional_content/downloadable_materials/item">
														<li class="list-group-item"><xsl:copy-of select="./node()"/></li>
													</xsl:for-each>
												</ul>
											</div>
											<div role="tabpanel" class="tab-pane playbook_case-study_online-resources">
												<xsl:attribute name="id"><xsl:value-of select="@slug"/>-online-resources</xsl:attribute>
												<ul class="list-group">
													<xsl:for-each select="additional_content/online_resources/item">
														<li class="list-group-item"><xsl:copy-of select="./node()"/></li>
													</xsl:for-each>
												</ul>
											</div>
											<div role="tabpanel" class="tab-pane playbook_case-study_related-projects-partners">
												<xsl:attribute name="id"><xsl:value-of select="@slug"/>-related-projects-partners</xsl:attribute>
												<ul class="list-group">
													<xsl:for-each select="additional_content/related_projects_partners/item">
														<li class="list-group-item"><xsl:copy-of select="./node()"/></li>
													</xsl:for-each>
												</ul>
											</div>
										</div>
									</div>
								</div>				
							</xsl:if>
						</section>
						<div class="well" style="margin-top: 2rem;"><i class="fa fa-lg fa-medium" style="margin-right: 1rem;"></i>Add your comments and feedback about this case on <a target="_blank"><xsl:attribute name="href"><xsl:value-of select="medium/@url"/></xsl:attribute>Medium</a>.</div>
						<!--
						<xsl:if test="additional_content/downloadable_materials">
							<section class="playbook_case-study_downloadable-materials">
								<xsl:attribute name="id"><xsl:value-of select="@slug"/>-downloadable-materials</xsl:attribute>
								<h4>Downloadable Materials</h4>
								<ul class="list-group">
									<xsl:for-each select="additional_content/downloadable_materials/item">
										<li class="list-group-item"><xsl:copy-of select="./node()"/></li>
									</xsl:for-each>
								</ul>
							</section>
						</xsl:if>
						<xsl:if test="additional_content/online_resources">
							<section class="playbook_case-study_online-resources">
								<xsl:attribute name="id"><xsl:value-of select="@slug"/>-online-resources</xsl:attribute>
								<h4>Online Resources</h4>
								<ul class="list-group">
									<xsl:for-each select="additional_content/online_resources/item">
										<li class="list-group-item"><xsl:copy-of select="./node()"/></li>
									</xsl:for-each>
								</ul>
							</section>
						</xsl:if>
						<xsl:if test="additional_content/related_projects_partners">
							<section class="playbook_case-study_related-projects-partners">
								<xsl:attribute name="id"><xsl:value-of select="@slug"/>-related-projects-partners</xsl:attribute>
								<h4>Related Remake Learning Projects &amp; Partners</h4>
								<ul class="list-group">
									<xsl:for-each select="additional_content/related_projects_partners/item">
										<li class="list-group-item"><xsl:copy-of select="./node()"/></li>
									</xsl:for-each>
								</ul>
							</section>
						</xsl:if>
						-->
					</article>
				</xsl:for-each>									
			</section><!--#case-studies-->
			<section id="plays-in-detail" class="bs-docs-section playbook_plays-in-detail clearfix">
				<xsl:copy-of select="$top_plays-in-detail" />
			</section>
			<section id="additional-resources" class="bs-docs-section playbook_resources clearfix">
				<header>
					<h1 class="page-header" id="additional-resources"><a href="playbook.html#additional-resources">Additional Resources</a></h1>
				</header>
			</section>
			<section id="acknowledgements" class="bs-docs-section clearfix">
				<header>
					<h1 class="page-header" id="acknowledgements"><a href="playbook.html#acknowledgements">Acknowledge<span class="visible-xs-inline">-</span>ments</a></h1>
				</header>
			</section>
			<xsl:copy-of select="$order-form" />
			<xsl:copy-of select="$license" />
			<xsl:copy-of select="$contact" />
		</div>
	</xsl:template>
	
	<xsl:template match="plays">
		<!--Table of Contents-->
		<div class="hidden-xs hidden-sm col-md-3" role="complementary">
			<xsl:copy-of select="$toc_plays-in-detail" />
		</div>
		
		<div class="col-xs-12 col-sm-12 col-md-9" role="main">
			<section id="about" class="bs-docs-section playbook_about clearfix">
				<xsl:copy-of select="$about-text" />
			</section>
			<section id="chapters" class="bs-docs-section playbook_chapters clearfix">
				<header>
					<h1 id="chapters" class="page-header">Playbook Chapters</h1>
				</header>
				<xsl:copy-of select="$toc-print_chapters" />
			</section>
			<section id="case-studies" class="bs-docs-section playbook_case-studies clearfix">
				<xsl:copy-of select="$top_case-studies" />
			</section>
			<section id="plays-in-detail" class="bs-docs-section playbook_plays-in-detail clearfix">
				<xsl:copy-of select="$top_plays-in-detail" />
				<xsl:for-each select="plays_group">
					<xsl:comment><xsl:value-of select="@action_area"/></xsl:comment>
					<article class="bs-docs-section playbook_plays-in-detail clearfix">
						<xsl:attribute name="id"><xsl:value-of select="@action_area"/></xsl:attribute>
						<header>
							<h1 class="page-header">
								<xsl:attribute name="id"><xsl:value-of select="@action_area"/></xsl:attribute>
								<xsl:value-of select="name"/>
							</h1>
							<p class="lead"><xsl:copy-of select="teaser/node()"/></p>
							<div class="panel panel-default">
								<div class="panel-heading">Thinking Questions</div>
								<div class="panel-body">
									<xsl:for-each select="thinking_questions/question">
										<p><strong><xsl:value-of select="question_heading"/></strong>: <xsl:value-of select="question_details"/></p>
									</xsl:for-each>
								</div>
							</div>
						</header>
						<xsl:for-each select="play">
							<section class="playbook_plays-in-detail_play">
								<div class="col-xs-12 col-sm-6 col-md-4 no-gutter-xs no-gutter-right pull-right">
									<div class="thumbnail">
										<img class="img-responsive">
											<xsl:attribute name="src">http://gameplan.remakelearning.org/data/photos/play_icons/<xsl:value-of select="@action_area"/>_<xsl:value-of select="@slug"/>.png</xsl:attribute>
											<xsl:attribute name="alt"><xsl:value-of select="name"/></xsl:attribute>
											<xsl:attribute name="title"><xsl:value-of select="name"/></xsl:attribute>
											<xsl:attribute name="style">
												<xsl:choose>
													<xsl:when test="@action_area='convene'"    >background-color: rgb(209,  78,  55);</xsl:when>
													<xsl:when test="@action_area='catalyze'"   >background-color: rgb( 57, 150, 207);</xsl:when>
													<xsl:when test="@action_area='communicate'">background-color: rgb(155, 156,  45);</xsl:when>
													<xsl:when test="@action_area='coordinate'" >background-color: rgb(179, 105, 171);</xsl:when>
													<xsl:when test="@action_area='champion'"   >background-color: rgb(212,  98,  28);</xsl:when>
												</xsl:choose>
											</xsl:attribute>
										</img>
									</div>
								</div>								
								<h2>
									<xsl:attribute name="id"><xsl:value-of select="@action_area"/>-<xsl:value-of select="@slug"/></xsl:attribute>
									<xsl:value-of select="name"/>
								</h2>
								<p><xsl:copy-of select="excerpt/node()"/></p>
								<ul class="fa-ul">
									<xsl:for-each select="getting_started/advice">
										<li><i class="fa-li fa fa-caret-right"></i><strong><xsl:value-of select="advice_heading"/></strong>: <xsl:value-of select="advice_details"/></li>
									</xsl:for-each>
								</ul>
							</section>
						</xsl:for-each>
					</article>
				</xsl:for-each>
			</section><!--#plays-in-detail-->
			<section id="additional-resources" class="bs-docs-section playbook_resources clearfix">
				<header>
					<h1 class="page-header" id="additional-resources"><a href="playbook.html#additional-resources">Additional Resources</a></h1>
				</header>
			</section>
			<section id="acknowledgements" class="bs-docs-section clearfix">
				<header>
					<h1 class="page-header" id="acknowledgements"><a href="playbook.html#acknowledgements">Acknowledge<span class="visible-xs-inline">-</span>ments</a></h1>
				</header>
			</section>
			<xsl:copy-of select="$order-form" />
			<xsl:copy-of select="$license" />
			<xsl:copy-of select="$contact" />
		</div>
	</xsl:template>
	
</xsl:stylesheet>