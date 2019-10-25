<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="${APP_PATH}/study/backstatic/img_files/js/jquery.min.js"></script>
	<link href="${APP_PATH}/study/backstatic/img_files/css/bootstrap.min.css" rel="stylesheet">
	<script src="${APP_PATH}/study/backstatic/img_files/js/bootstrap.min.js"></script>
	<link href="${APP_PATH}/study/backstatic/img_files/css/style.css" rel="stylesheet">
	
</head>
<body>

<jsp:include page="back-head.jsp"/>
<div class="workingArea" style="margin-left: 200px; ">
		<ol class="breadcrumb">
		  <li class="active">&nbsp;&nbsp;&nbsp;&nbsp;产品图片管理</li>
		</ol>

	<table class="addPictureTable" align="center">
		<tbody><tr>
			<td class="addPictureTableTD">
			  <div>
				<div class="panel panel-warning addPictureDiv">
					<div class="panel-heading">新增产品<b class="text-primary"> 单个 </b>图片</div>
					  <div class="panel-body">
					    	<form method="post" class="addFormSingle" enctype="multipart/form-data1">
					    		<table class="addTable">
					    			<tbody><tr>
					    				<td>请选择本地图片 尺寸400X400 为佳</td>
					    			</tr>
					    			<tr>
					    				<td>
					    					<input id="filepathSingle" type="file" name="filepath">
					    				</td>
					    			</tr>
					    			<tr class="submitTR">
					    				<td align="center">
					    					<input type="hidden" name="type" value="type_single">
					    					<input type="hidden" name="pid" value="91">
					    					<button type="submit" class="btn btn-success">提 交</button>
					    				</td>
					    			</tr>
					    		</tbody></table>
					    	</form>
					  </div>
				  </div>			  
			  	<table class="table table-striped table-bordered table-hover  table-condensed"> 
					<thead>
						<tr class="success">
							<th>ID</th>
							<th>产品单个图片缩略图</th>
							<th>删除</th>
						</tr>
					</thead>
					<tbody>
						
							<tr>
								<td>676</td>
								<td>
								<img height="50px" src="${APP_PATH}/study/backstatic/img_files/img/676.jpg">
								</td>
								<td>
									<button type="button" class="btn btn-danger" style="float:right;
									margin-right:50px; margin-top: 10px;"><i class=" glyphicon glyphicon-trash"></i></button>
								</td>
		
							</tr>
						
							<tr>
								<td>675</td>
								<td>
								<img height="50px" src="${APP_PATH}/study/backstatic/img_files/img/675.jpg">
								</td>
								<td>
									<button type="button" class="btn btn-danger" style="float:right;
									margin-right:50px; margin-top: 10px;"><i class=" glyphicon glyphicon-trash"></i></button>
								</td>
		
							</tr>
						
							<tr>
								<td>674</td>
								<td>
								<img height="50px" src="${APP_PATH}/study/backstatic/img_files/img/674.jpg">
								</td>
								<td>
									<button type="button" class="btn btn-danger" style="float:right;
									margin-right:50px; margin-top: 10px;"><i class=" glyphicon glyphicon-trash"></i></button>
								</td>
		
							</tr>
						
							<tr>
								<td>673</td>
								<td>
								<img height="50px" src="${APP_PATH}/study/backstatic/img_files/img/673.jpg">
								</td>
								<td>
									<button type="button" class="btn btn-danger" style="float:right;
									margin-right:50px; margin-top: 10px;"><i class=" glyphicon glyphicon-trash"></i></button>
								</td>
							</tr>
						
							<tr>
								<td>672</td>
								<td>
								<img height="50px" src="${APP_PATH}/study/backstatic/img_files/img/672.jpg">
								</td>
								<td>
									<button type="button" class="btn btn-danger" style="float:right;
									margin-right:50px; margin-top: 10px;"><i class=" glyphicon glyphicon-trash"></i></button>
								</td>
		
							</tr>
						
					</tbody>	  
				</table>	
						
			  </div>			
			</td>
			<td class="addPictureTableTD">
			  <div>
			  	
				<div class="panel panel-warning addPictureDiv">
					<div class="panel-heading">新增产品<b class="text-primary"> 详情 </b>图片</div>
					  <div class="panel-body">
					    	<form method="post" class="addFormDetail" enctype="multipart/form-data">
					    		<table class="addTable">
					    			<tbody><tr>
					    				<td>请选择本地图片 宽度790  为佳</td>
					    			</tr>
					    			<tr>
					    				<td>
					    					<input id="filepathDetail" type="file" name="filepath">
					    				</td>
					    			</tr>
					    			<tr class="submitTR">
					    				<td align="center">
					    					<input type="hidden" name="type" value="type_detail">
					    					<input type="hidden" name="pid" value="91">
					    					<button type="submit" class="btn btn-success">提 交</button>
					    				</td>
					    			</tr>
					    		</tbody></table>
					    	</form>
					  </div>
				  </div>
				  <table class="table table-striped table-bordered table-hover  table-condensed"> 
						<thead>
							<tr class="success">
								<th>ID</th>
								<th>产品详情图片缩略图</th>
								<th>删除</th>
							</tr>
						</thead>
						<tbody>
							
								<tr>
									<td>682</td>
									<td>
										<img height="50px" src="${APP_PATH}/study/backstatic/img_files/img/682.jpg">
									</td>
									<td>
									<button type="button" class="btn btn-danger" style="float:right;
									margin-right:50px; margin-top: 10px;"><i class=" glyphicon glyphicon-trash"></i></button>
								</td>
			
								</tr>
							
								<tr>
									<td>681</td>
									<td>
										<img height="50px" src="${APP_PATH}/study/backstatic/img_files/img/681.jpg">
									</td>
									<td>
									<button type="button" class="btn btn-danger" style="float:right;
									margin-right:50px; margin-top: 10px;"><i class=" glyphicon glyphicon-trash"></i></button>
								</td>
			
								</tr>
							
								<tr>
									<td>680</td>
									<td>
										<img height="50px" src="${APP_PATH}/study/backstatic/img_files/img/680.jpg">
									</td>
									<td>
									<button type="button" class="btn btn-danger" style="float:right;
									margin-right:50px; margin-top: 10px;"><i class=" glyphicon glyphicon-trash"></i></button>
								</td>
			
								</tr>
							
								<tr>
									<td>679</td>
									<td>
										<img height="50px" src="${APP_PATH}/study/backstatic/img_files/img/679.jpg">
									</td>
									<td>
									<button type="button" class="btn btn-danger" style="float:right;
									margin-right:50px; margin-top: 10px;"><i class=" glyphicon glyphicon-trash"></i></button>
								</td>
			
								</tr>
							
								<tr>
									<td>678</td>
									<td>
										<img height="50px" src="${APP_PATH}/study/backstatic/img_files/img/678.jpg">
									</td>
									<td>
									<button type="button" class="btn btn-danger" style="float:right;
									margin-right:50px; margin-top: 10px;"><i class=" glyphicon glyphicon-trash"></i></button>
								</td>
			
								</tr>
							
								<tr>
									<td>677</td>
									<td>
										<img height="50px" src="${APP_PATH}/study/backstatic/img_files/img/677.jpg">
									</td>
									<td>
									<button type="button" class="btn btn-danger" style="float:right;
									margin-right:50px; margin-top: 10px;"><i class=" glyphicon glyphicon-trash"></i></button>
									</td>
				
								</tr>
							
						</tbody>	  
					</table>					  		
			  </div>			
			</td>
		</tr>
	</tbody>
</table>
</div>
</body></html>