-- Instrumentos Metrologia · códigos de identificação (gravação a laser)
-- Rode no SQL Editor do Supabase
-- codigo = identificador imutável (como CPF)

alter table public.instrumentos add column if not exists codigo text;
alter table public.instrumentos add column if not exists prioridade text;
create unique index if not exists instrumentos_codigo_uidx on public.instrumentos (codigo) where codigo is not null;

delete from public.calibracoes;
delete from public.instrumentos;

insert into public.instrumentos (codigo, equipamento, tipo, fabricante, modelo, serie, setor, responsavel, periodicidade, ultima, situacao, emp, obs) values
('PQ-001', 'Paquimetro 0-150mm (0,02)', 'Paquímetro', 'Digimess', NULL, '20041759', 'Ferramentaria', 'Filipe França', 12, NULL, 'Ativo', '±0,04', 'Orçamento 3D item 1 · RBC'),
('PQ-002', 'Paquimetro 0-150mm (0,05)', 'Paquímetro', 'Digimess', '100.001A', '1905859', NULL, 'Bruno Machado Dorneles', 12, NULL, 'Ativo', '±0,04', 'Orçamento 3D item 1 · RBC'),
('PQ-003', 'Paquimetro 0-300mm (0,02)', 'Paquímetro', 'Digimess', '100025', '111609', NULL, 'Bruno Machado Dorneles', 12, NULL, 'Ativo', '±0,04', 'Orçamento 3D item 2 · RBC'),
('PQ-004', 'Paquimetro 0-600mm (0,02)', 'Paquímetro', 'Digimess', '100062', NULL, NULL, 'Bruno Machado Dorneles', 12, NULL, 'Ativo', '±0,04', 'Orçamento 3D item 3 · completar série/etiqueta'),
('RC-001', 'Relógio comparador 0-10mm (0,01)', 'Relógio Comparador', NULL, NULL, NULL, NULL, 'Bruno Machado Dorneles', 12, NULL, 'Ativo', '±0,01', 'Orçamento 3D item 4 (0-12,7mm) · confirmar faixa'),
('TC-001', 'Tacômetro', 'Tacômetro', 'Minipa', 'MDT-2238B', NULL, NULL, 'Bruno Machado Dorneles', 12, NULL, 'Ativo', '±2%', 'Orçamento 3D item 5 · rastreado RBC'),
('PP-001', 'Pistola de Ponto', 'Pistola de Ponto', 'Planatc', 'PP-1000', NULL, NULL, 'Bruno Machado Dorneles', 12, NULL, 'Ativo', '±10', 'Orçamento 3D item 6 · sem histórico prévio · rastreado RBC'),
('MN-001', 'Manômetro 0-400bar 0-6000psi', 'Manômetro', 'HIDROPRESS', NULL, NULL, NULL, 'Bruno Machado Dorneles', 12, NULL, 'Ativo', '±2%', 'Orçamento 3D item 7 · identificar série'),
('MN-002', 'Manômetro 0-400bar 0-5800psi', 'Manômetro', 'HIDROPRESS', NULL, NULL, NULL, 'Bruno Machado Dorneles', 12, NULL, 'Ativo', '±2%', 'Orçamento 3D item 7 · identificar série'),
('MN-003', 'Manômetro 0-20 bar 0-300psi', 'Manômetro', NULL, NULL, NULL, NULL, 'Bruno Machado Dorneles', 12, NULL, 'Ativo', '±2%', 'Orçamento 3D item 7 · identificar série'),
('MN-004', 'Manômetro 0-20 bar 0-300psi', 'Manômetro', NULL, NULL, NULL, NULL, 'Bruno Machado Dorneles', 12, NULL, 'Ativo', '±2%', 'Orçamento 3D item 7 · identificar série'),
('MN-005', 'Manômetro 0-20 bar 0-300psi', 'Manômetro', NULL, NULL, NULL, NULL, 'Bruno Machado Dorneles', 12, NULL, 'Ativo', '±2%', 'Orçamento 3D item 7 · identificar série'),
('MN-006', 'Manômetro 0-16bar 0-250psi', 'Manômetro', NULL, NULL, NULL, NULL, 'Bruno Machado Dorneles', 12, NULL, 'Ativo', '±2%', 'Orçamento 3D item 7 · identificar série'),
('TQ-001', 'Torquímetro de Estalo 1/2 40-200Nm', 'Torquímetro', 'Tramontina', NULL, '455508-400', NULL, 'Bruno Machado Dorneles', 12, NULL, 'Ativo', '±4%', 'Orçamento 3D item 8 · 1 sentido (horário) ·  ⚠ ATENÇÃO: mesma Série/Código (455508-400) da linha 19 — parece ser o MESMO instrumento cadastrado 2x. Confirmar e manter só 1 linha antes de gravar o código.'),
('TQ-002', 'Torquímetro de Estalo 1/2 40-200Nm', 'Torquímetro', 'Tramontina', NULL, '455508-400', NULL, 'Bruno Machado Dorneles', 12, '2024-08-19', 'Ativo', '±4%', 'VENCIDO · recalibrar · orçamento 3D item 8 ·  ⚠ ATENÇÃO: mesma Série/Código (455508-400) da linha 18 — parece ser o MESMO instrumento cadastrado 2x. Confirmar e manter só 1 linha antes de gravar o código.'),
('TQ-003', 'Torquímetro de Estalo 3/4 200-1000Nm', 'Torquímetro', 'Tramontina', NULL, '44508-401', NULL, 'Bruno Machado Dorneles', 12, '2025-08-25', 'Aguardando calibração', '±4%', 'Fora do orçamento 000719/2026 · solicitar inclusão à 3D'),
('MC-001', 'Medidor de Compressão 0-20 bar 0-300psi', 'Medidor de Compressão', 'FortG', 'FG8810', '82537', NULL, 'Bruno Machado Dorneles', 12, NULL, 'Ativo', '±2%', 'Orçamento 3D item 9'),
('MC-002', 'Medidor de Compressão 0-70bar 0-1000psi', 'Medidor de Compressão', 'Haste Tecnologia Ltda', 'MCD300-i', NULL, NULL, 'Bruno Machado Dorneles', 12, NULL, 'Ativo', '±2%', 'Orçamento 3D item 10 · completar série'),
('TA-001', 'Teste de Arrefecimento 0-2 bar 0-30psi', 'Teste de Arrefecimento', 'Planatc', 'Sa-700', NULL, NULL, 'Bruno Machado Dorneles', 12, NULL, 'Aguardando calibração', '±2%', 'Orçamento 3D item 11'),
('MV-001', 'Medidor de Vazão de Cilindro', 'Medidor de Vazão', 'Planatc', 'MVC-3000/3200', '20102-38-03046', NULL, 'Bruno Machado Dorneles', 12, NULL, 'Ativo', '±2%', 'Orçamento 3D item 12');

select codigo, equipamento, situacao from public.instrumentos order by codigo;