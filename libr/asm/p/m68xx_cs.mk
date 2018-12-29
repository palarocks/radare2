OBJ_M68XX_CS=asm_m68xx_cs.o

include p/capstone.mk

STATIC_OBJ+=${OBJ_M68XX_CS}
SHARED_OBJ+=${SHARED_M68XX_CS}
TARGET_M68XX_CS=asm_m68xx_cs.${EXT_SO}

ifeq ($(WITHPIC),1)
ALL_TARGETS+=${TARGET_M68XX_CS}

${TARGET_M68XX_CS}: ${OBJ_M68XX_CS}
	${CC} $(call libname,asm_m68xx_cs) ${LDFLAGS} ${CFLAGS} $(CS_LDFLAGS) \
		-o ${TARGET_M68XX_CS} ${OBJ_M68XX_CS} ${SHARED2_M68XX_CS}
endif