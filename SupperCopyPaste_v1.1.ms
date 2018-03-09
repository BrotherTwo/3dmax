rollout SCP "SCP_By:Bro2" width:168 height:300
(
	button btn1 "复制模型" pos:[16,24] width:64 height:32
	button btn2 "粘贴模型" pos:[88,24] width:64 height:32
	button btn3 "复制材质" pos:[16,88] width:64 height:32
	button btn4 "粘贴材质" pos:[88,88] width:64 height:32
	button btn7 "复制动画" pos:[16,240] width:64 height:32
	button btn8 "粘贴动画" pos:[88,240] width:64 height:32
	groupBox grp1 "模型" pos:[8,8] width:152 height:56
	groupBox grp2 "材质" pos:[8,72] width:152 height:144
	button btn5 "复制材质编辑器所有材质" pos:[16,136] width:136 height:32
	button btn6 "粘贴材质编辑器所有材质" pos:[16,176] width:136 height:32
	groupBox grp3 "动画" pos:[8,224] width:152 height:56
	
	
	on btn1 pressed  do
	(
		thecopypastedir = getdir #autoback -- CHANGE THIS TO ANY FOLDER YOU WANT
		thecopypastefile = "\pastefile.max" --this is the filename to save as...
		thecopypastestring = thecopypastedir + thecopypastefile --this is the complete string
		
		if $ != undefined do 
		saveNodes $ thecopypastestring --this saves ("copies") the objects as a file
	)
	on btn2 pressed  do
	(
		thecopypastedir = getdir #autoback -- CHANGE THIS TO ANY FOLDER YOU WANT
		thecopypastefile = "\pastefile.max" --this is the filename to save as...
		thecopypastestring = thecopypastedir + thecopypastefile --this is the complete string
		mergemaxfile (thecopypastedir + thecopypastefile) #select --this merges ("pastes") and selects objects from file
	)
	on btn3 pressed  do
	(
		thecopypastedir = getdir #autoback -- CHANGE THIS TO ANY FOLDER YOU WANT
		thecopypastefile = "\pastematfile.mat" --this is the filename to save as...
		thecopypastestring = thecopypastedir + thecopypastefile --this is the complete string
		
		selectedmat=medit.GetCurMtl()
		pastelib=loadTempMaterialLibrary thecopypastestring	
		if pastelib == undefined then 
		(
			loadDefaultMatLib			
			saveTempMaterialLibrary currentMaterialLibrary thecopypastestring
			pastelib=loadTempMaterialLibrary thecopypastestring
		)
				
		for i=1 to pastelib.count do
		(
			deleteitem pastelib (i)
		)
			--currentMaterialLibrary
			append pastelib selectedmat
			saveTempMaterialLibrary pastelib thecopypastestring
			--if $ != undefined do 
				--saveNodes $ thecopypastestring --this saves ("copies") the objects as a file
	)
	on btn4 pressed  do
	(
		thecopypastedir = getdir #autoback -- CHANGE THIS TO ANY FOLDER YOU WANT
		thecopypastefile = "\pastematfile.mat" --this is the filename to save as...
		thecopypastestring = thecopypastedir + thecopypastefile --this is the complete string
		    
		pastelib=loadTempMaterialLibrary thecopypastestring
		selectedmatslot= activeMeditSlot
		pastedmat=pastelib[1]
		setMeditMaterial selectedmatslot pastedmat
		--mergemaxfile (thecopypastedir + thecopypastefile) #select --this merges ("pastes") and selects objects from file
	)
	on btn5 pressed  do
	(
		allthecopypastedir = getdir #autoback -- CHANGE THIS TO ANY FOLDER YOU WANT
		allthecopypastefile = "\allpastematfile.mat" --this is the filename to save as...
		allthecopypastestring = allthecopypastedir + allthecopypastefile --this is the complete string
		
		--selectedmat=medit.GetCurMtl()
		allpastelib=loadTempMaterialLibrary allthecopypastestring	
		if allpastelib == undefined then 
		(
			loadDefaultMatLib			
			saveTempMaterialLibrary currentMaterialLibrary allthecopypastestring
			allpastelib=loadTempMaterialLibrary allthecopypastestring
		)
				
		--for i=1 to allpastelib.count do(
		--deleteitem allpastelib(i)
		--)
		--currentMaterialLibrary
		for n=1 to 24 do
		(
			allpastelib[n]=meditMaterials[n]
		)
		saveTempMaterialLibrary allpastelib allthecopypastestring
		--if $ != undefined do 
		--saveNodes $ allthecopypastestring --this saves ("copies") the objects as a file
	)
	on btn6 pressed  do
	(
		allthecopypastedir = getdir #autoback -- CHANGE THIS TO ANY FOLDER YOU WANT
		allthecopypastefile = "\allpastematfile.mat" --this is the filename to save as...
		allthecopypastestring = allthecopypastedir + allthecopypastefile --this is the complete string
		    
		allpastelib=loadTempMaterialLibrary allthecopypastestring
		--selectedmatslot= activeMeditSlot
		if allpastelib != undefined do
		(
			for p=1 to 24 do
			(
				meditMaterials[p]=allpastelib[p]
			)
		)
		--pastedmat=allpastelib[1]
		--setMeditMaterial selectedmatslot pastedmat
		--mergemaxfile (allthecopypastedir + allthecopypastefile) #select --this merges ("pastes") and selects objects from file
	)

	on btn7 pressed  do
	(
		global animateobj = $
		global numKeysPos =  numKeys animateobj.position.controller
		global numKeysRot =  numKeys animateobj.rotation.controller
		global numKeysScl =  numKeys animateobj.scale.controller
 
		global keysTimePos = #()
		global keysTimeRot = #()
		global keysTimeScl = #()
		global animateobj = $
		if animateobj != undefined do 
		(
			for i = 1 to numKeysPos do 
			( 
			 
				keysTimePos[i] = getKeyTime animateobj.position.controller i 
				print keysTimePos[i]
			
			)
			 
			 
			 
			for i = 1 to numKeysRot do 
			( 
			 
				keysTimeRot[i] = getKeyTime animateobj.rotation.controller i 
				print  keysTimeRot[i]
			
			)
			 
			 
			 
			 for i = 1 to numKeysScl do 
			( 
			 
				keysTimeScl[i] = getKeyTime animateobj.scale.controller i 
				print keysTimeScl[i]  
				 
			)		
		)
	)
	
on btn8 pressed  do
	(
		if animateobj!=$ do 
		(
			global gainobj=$
		print gainobj
		print animatobj
		
			if numKeysPos!=0 then (
			
				for i = 1 to numKeysPos do ( 
							  
					animate on (
						 
						sliderTime =  keysTimePos[i]  
						at time keysTimePos[i]  gainobj.pos  =  animateobj.pos
									 
							)
							 
						)
	 
					)
			
			if numKeysRot!=0 then (
			
				for i = 1 to numKeysRot do ( 
							  
					animate on (
						 
						sliderTime =  keysTimeRot[i]  
						at time keysTimeRot[i]  gainobj.rotation.controller = copy  animateobj.rotation.controller
						--at time keysTimeRot[i]  gainobj.rotation.y_rotation  =  animateobj.rotation.y_rotation
						--at time keysTimeRot[i]  gainobj.rotation.z_rotation  =  animateobj.rotation.z_rotation	
									 
							)
							 
						)
	 
					)
					
			if numKeysScl!=0 then (
	 
	 
				for i = 1 to numKeysScl do ( 
							  
					animate on (
						 
						sliderTime =  keysTimeScl[i]  
						at time keysTimeScl[i]  gainobj.scale  =  animateobj.scale
									 
							)
							 
						 )
	 
					 )
				 
		)
	)
	hyperlink theHyperlink "更多插件" address:"http://bro2.cn/" color:(color 160 160 160) pos:[60,284] 






)
createDialog SCP