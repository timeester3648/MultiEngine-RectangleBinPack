void main(MultiBuild::Workspace& workspace) {	
	auto project = workspace.create_project(".");
	auto properties = project.properties();

	properties.name("RectangleBinPack");
	properties.binary_object_kind(MultiBuild::BinaryObjectKind::eStaticLib);

	project.include_own_required_includes(true);
	project.add_required_project_include({
		"."
	});

	properties.files({
		"./*.h",
		"./*.cpp"
	});

	properties.excluded_files("./boost_binpacker.cpp");

	{
		MultiBuild::ScopedFilter _(workspace, "project.compiler:VisualCpp");
		properties.disable_warnings("4267");
	}
}