
var basePath = location.protocol + "//" + location.host + "/";
var _url = location.protocol + "//" + location.host + "/invoice/wait";
$(function(){
	
	 /* 生成列表*/
    var _options = {
        "url": _url + '/selectinvoicewaitdata', 
        "tableClass":"nick-table",
        "wordBreakTd":[0,1,2,3,4,5,6],
        "wordBreakThAll":true,
        "isLoading": true,
        "isIconBtn":true,
        "columnMinWidth":[
	        {
	        	"columnIndex":10,
                "width":"100px",
                "textAlign":'center'
            }
        ]
    };
    $('#contTab').tableData(_options,initPage);

    function initPage(args){
        $(".pages").createPage(args,goPage);  /** goPage 点击翻页调用的方法 **/
    }

    /**
     * 翻页
     */
    function goPage(pn) {
        console.log('点击翻页调用的方法，使用后台自己的方法')
        $("#popDiv").show();
        var u = _url + "/selectinvoicewaitlist?pn="+pn;
        $(".j-by-form-search").attr("action",u);
        $('.j-by-form-search').submit();
    }
    
    /******************** 搜索按钮 start ********************/
    $('.j-by-search').on('click',function(){
    	var t_regular = new RegExp("[`~!@#$^&*=|';'\\\\.<>/?~！@#￥……&*|；'。，、？]");
    	var str = $("#j-form-searchContext").val();
    	
    	if(!t_regular.test(str)) {
			$("#popDiv").show();
			$("#applyStartTime").val($("#ast").val());
			$("#applyEndTime").val($("#aet").val());
			$("#contractStatus").val($("#j-form-contractStatus").val());
			$("#searchContext").val($("#j-form-searchContext").val());
			$("#searchFlag").val("1");
			$("#pns").val("1");
			
			var u = _url + "/selectinvoicepaperapproveddetaillist";
	        $(".j-by-form-search").attr("action",u);
			$('.j-by-form-search').submit();
    	} else {
    		toastr.warning('请输入正确的搜索内容（禁止输入非法字符不包含：_下划线）');
    		return false;
    	}
	});
    /******************** 搜索按钮 end ********************/
    
    /******************** 组织结构树 start ********************/
    var opts = {
        id:'Modal',
        title:'',
        content:"",/** content内容由后台根据需求自己配置 */
        btn:0,
        size:'',
        btnOk:function(){
            /** code here 后台添加确认按钮的回调事件 */
        }
    };
    var classmanager;
    var modalInit;
    $('.j-lisa-select').off('click');
    $('.j-lisa-select').on('click',function(e){
        opts.id='select-Modal';
        opts.title="组织";
        opts.content='<ul class="j-silense-tree"></ul>';
        opts.size='';
        opts.btnOk=getModalButton;
        modalInit = $(this).modalDialog(opts);
        var url = basePath + 'invoice/paperapprovalwait/getorganizationtreeinvoice'
        $("#popDiv").show();
		$.ajax({
			type:"POST",
			url:url,
			dataType:'json',
			success:function(data){
				var classList = data;
				var classlength = classList.length;
				if(classlength > 0){
					$(function (){   
						var data = [];
						for(var i=0;i<classList.length;i++){
							data.push({ id: classList[i].cOrgId, pid: classList[i].parentId, text:classList[i].orgName,level:classList[i].level});
						}
						$(".j-silense-tree").ligerTree({ 
							checkbox :false,
							parentIcon:null, 
							childIcon:null,
							idFieldName :'id',
							nodeWidth:368,
							parentIDFieldName :'pid'
						});
						classmanager = $(".j-silense-tree").ligerGetTreeManager();
						classmanager.clear();
						classmanager.setData(data);
					});	
				}
				$("#popDiv").fadeOut();
				modalInit.show();
			},
			//调用出错执行的函数
			error: function(){
			    //请求出错处理
			}        
		}); 
        e.stopPropagation();
    });
	function getModalButton(){
		var flagtree = classmanager.getSelected();
		if(flagtree=='' || flagtree==null){
			toastr.warning('您还没有选择节点。');
			return true;
		} else {
			_val = classmanager.getSelected().data.id;
			_valName = classmanager.getSelected().data.text;
			$("input[name='pns']").val(1);
			$("input[name='requireOrgId']").val(_val);
			$("input[name='requireOrgName']").val(_valName);
			$(".j-lisa-select").html(_valName);
			
			$(".j-by-form-search").submit();
		}
	}
    /******************** 组织结构树 end ********************/
    
    $('body').on('click','.div-click a:not(".readonly")',function(e){
        var _this = $(this);
        var iconName = _this.attr('data-icon');
        switch(iconName){
            case "browse": //申请开票
                goDetail(_this,e);
                break;
            default:
                console.log('not find！')
        }
    });
    
    function goDetail(_this){
    	var _id = $(_this).attr("data-id");
        var _urls = $(_this).attr('data-url');
        window.open(_urls + "&detailType=approval");
    }
    
    $(".j-wait-overview").on("click",function() { //待处理发票申请
		window.location.href = basePath + "invoice/paperapprovalwait/selectinvoicepaperwaitoverviewlist";
		$("#popDiv").show();
    });
    
    $(".j-approved-overview").on("click",function() { //已处理发票申请
		window.location.href = basePath + "invoice/paperapproved/selectinvoicepaperapprovedoverviewlist";
		$("#popDiv").show();
    });
	
});
