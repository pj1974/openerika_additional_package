-project_name=getenv("ECLAIR_PROJECT_NAME")
-project_root=getenv("ECLAIR_PROJECT_ROOT")

-setq=data_dir,getenv("ECLAIR_DATA_DIR")

-doc_begin="Configure and enable service for generating reports in ECB format."
-enable=B.REPORT.ECB
-config=B.REPORT.ECB,output=join_paths(data_dir,"FRAME.@FRAME@.ecb")
-config=B.REPORT.ECB,preprocessed=show
-config=B.REPORT.ECB,macros=10
-doc_end

-doc="Enable service to explain ECLAIR configuration."
-enable=B.EXPLAIN

-doc="Enable MISRA C:2025 coding standard."
-enable=MC4

-doc="Software requirements traceability is not assessed with ECLAIR."
-disable=MC4.D3.1

-doc="The project uses unions and is aware of their associated pitfalls."
-disable=MC4.R19.2

-doc="Deviation for MISRA C violations."
-eval_file=deviations.ecl

-doc="Project-specific report tagging rules."
-eval_file=tagging.ecl
