{include:{$BACKEND_CORE_PATH}/layout/templates/head.tpl}
{include:{$BACKEND_CORE_PATH}/layout/templates/structure_start_module.tpl}

{form:edit}
	<div class="box horizontal labelWidthLong">
		<div class="heading">
			<h3>{$lblTemplates|ucfirst}: {$lblEditTemplate}</h3>
		</div>
		<div class="options">
			<p>
				<label for="file">{$msgPathToTemplate|ucfirst}</label>
				{$ddmTheme}<small><code>/core/templates/</code></small>{$txtFile} {$ddmThemeError} {$txtFileError}
				<span class="helpTxt">{$msgHelpTemplateLocation}</span>
			</p>
			<p>
				<label for="label">{$lblLabel|ucfirst}</label>
				{$txtLabel} {$txtLabelError}
			</p>
			<p>
				<label for="numBlocks">{$lblNumberOfBlocks|ucfirst}</label>
				{$ddmNumBlocks} {$ddmNumBlocksError}
				{option:inUse}<span class="helpTxt"><span class="infoMessage">{$msgTemplateInUse}</span></span>{/option:inUse}
			</p>
		</div>
		{* Don't change this ID *}
		<div id="metaData" class="options">
			{iteration:names}
				<p>
					<label for="name{$names.i}">{$lblName|ucfirst} {$names.i}</label>
					{$names.txtName} {$names.ddmType}
					{$names.txtNameError} {$names.ddmTypeError}
				</p>
			{/iteration:names}
		</div>
		<div class="options">
			<p>
				<label for="format">{$lblLayout|ucfirst}</label>
				{$txtFormat} {$txtFormatError}
				<span class="helpTxt">{$msgHelpTemplateFormat}</span>
			</p>
		</div>
		<div class="options">
			<div class="spacing">
				<ul class="inputList pb0">
					<li><label for="active">{$chkActive} {$lblActive|ucfirst}</label> {$chkActiveError}</li>
					<li><label for="default">{$chkDefault} {$lblDefault|ucfirst}</label> {$chkDefaultError}</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="fullwidthOptions">
		{option:deleteAllowed}
			<a href="{$var|geturl:'delete_template'}&amp;id={$template.id}" data-message-id="confirmDelete" class="askConfirmation button linkButton icon iconDelete">
				<span>{$lblDelete|ucfirst}</span>
			</a>
		{/option:deleteAllowed}
		<div class="buttonHolderRight">
			<input id="editButton" class="inputButton button mainButton" type="submit" name="edit" value="{$lblSave|ucfirst}" />
		</div>
	</div>

	<div id="confirmDelete" title="{$lblDelete|ucfirst}?" style="display: none;">
		<p>{$msgConfirmDeleteTemplate|sprintf:{$template.label}}</p>
	</div>
{/form:edit}

{include:{$BACKEND_CORE_PATH}/layout/templates/structure_end_module.tpl}
{include:{$BACKEND_CORE_PATH}/layout/templates/footer.tpl}