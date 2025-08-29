
<template>

<v-file-input
	v-model="files"
	small-chips
	show-size
	multiple
	clearable
	@change="inputChanged"
>

<template v-slot:selection="{text, index, file}">
	<v-chip small text-color="white" color="#295671" close
	@click:close="remove(index)">
		{{ text }}
	</v-chip>
</template>
</v-file-input>
</template>

<script> 
export default { 
	data: () => ({ 
		files: []
	}),
	methods: {
		remove(index){
			this.files.splice(index,1)
		},
		inputChanged(){
			console.log(this.files)
		}
	},
  }
</script>
